#############################################
# SECURITY GROUP DA APLICAÇÃO
# O que cria:
# - Firewall das instâncias da aplicação
# Para que serve:
# - Permitir HTTP apenas vindo do ALB
# - Permitir SSH para estudos
# Recurso ligado:
# - Auto Scaling / Launch Template
#############################################
resource "aws_security_group" "app_sg" {
  name        = "${var.project_name}-APP-SG"
  description = "Security Group das instancias da aplicacao"
  vpc_id      = var.vpc_id

  #############################################
  # ENTRADA HTTP VINDO DO ALB
  # O que faz:
  # - Permite que apenas o ALB acesse a app
  #############################################
  ingress {
    description     = "HTTP from ALB"
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [var.alb_security_group_id]
  }

  #############################################
  # ENTRADA SSH
  # O que faz:
  # - Permite acesso SSH para laboratorio
  # Observação:
  # - Em produção, isso deve ser restrito
  #############################################
  ingress {
    description = "SSH access"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  #############################################
  # SAÍDA
  #############################################
  egress {
    description = "All outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.project_name}-APP-SG"
  }
}