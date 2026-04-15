#############################################
# SECURITY GROUP DO ALB
# O que cria:
# - Firewall do Load Balancer
# Para que serve:
# - Permitir acesso HTTP vindo da internet
# Recurso ligado:
# - aws_lb.app_alb
#############################################
resource "aws_security_group" "alb_sg" {
  name        = "${var.project_name}-ALB-SG"
  description = "Security Group do Application Load Balancer"
  vpc_id      = var.vpc_id

  #############################################
  # REGRA DE ENTRADA HTTP
  # O que faz:
  # - Libera acesso na porta 80
  #############################################
  ingress {
    description = "HTTP inbound"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  #############################################
  # REGRA DE SAÍDA
  # O que faz:
  # - Permite trafego de saída
  #############################################
  egress {
    description = "All outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.project_name}-ALB-SG"
  }
}

#############################################
# APPLICATION LOAD BALANCER
# O que cria:
# - Load Balancer publico
# Para que serve:
# - Receber acessos da internet e distribuir para targets
# O que faz:
# - Usa duas subnets publicas
# - Fica acessivel publicamente
# Recurso ligado:
# - Security Group
# - Target Group
#############################################
resource "aws_lb" "app_alb" {
  name               = "${var.project_name}-ALB"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb_sg.id]
  subnets            = var.public_subnet_ids

  tags = {
    Name = "${var.project_name}-ALB"
  }
}

#############################################
# TARGET GROUP
# O que cria:
# - Grupo de destinos do ALB
# Para que serve:
# - Definir para onde o ALB vai encaminhar requisicoes
# O que faz:
# - Usa HTTP na porta 80
# - Faz health check no path /
# Recurso ligado:
# - aws_lb_listener.http
# - aws_lb_target_group_attachment.ec2_attachment
#############################################
resource "aws_lb_target_group" "app_tg" {
  name     = "${var.project_name}-TG"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  #############################################
  # HEALTH CHECK
  # O que faz:
  # - Verifica se a aplicacao esta respondendo
  #############################################
  health_check {
    path                = "/"
    protocol            = "HTTP"
    matcher             = "200"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }

  tags = {
    Name = "${var.project_name}-TG"
  }
}

#############################################
# LISTENER HTTP
# O que cria:
# - Listener do ALB
# Para que serve:
# - Escutar a porta 80 e encaminhar para o target group
# Recurso ligado:
# - aws_lb.app_alb
# - aws_lb_target_group.app_tg
#############################################
resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.app_alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.app_tg.arn
  }
}