#############################################
# DATA SOURCE - AMI AMAZON LINUX
# O que faz:
# - Busca a AMI mais recente
# Para que serve:
# - Evita hardcode
#############################################
data "aws_ami" "amazon_linux" {
  most_recent = true

  owners = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

#############################################
# LAUNCH TEMPLATE
# O que cria:
# - Modelo de configuracao das instancias
# Para que serve:
# - Servir de base para o Auto Scaling Group
# O que faz:
# - Define AMI
# - Define tipo da instancia
# - Define security group
# - Define IAM instance profile
# - Define user_data
#############################################
resource "aws_launch_template" "app_lt" {
  name_prefix   = "${var.project_name}-LT-"
  image_id      = data.aws_ami.amazon_linux.id
  instance_type = var.instance_type

  vpc_security_group_ids = [var.security_group_id]

  iam_instance_profile {
    name = var.instance_profile_name
  }

  user_data = base64encode(<<-EOF
              #!/bin/bash
              yum update -y
              yum install -y httpd aws-cli
              systemctl start httpd
              systemctl enable httpd

              cat <<HTML > /var/www/html/index.html
              <html>
                <head><title>Terraform AppWeb</title></head>
                <body>
                  <h1>Terraform-AppWeb</h1>
                  <p>Instancia criada via Auto Scaling Group.</p>
                  <p>Bucket S3 vinculado: ${var.bucket_name}</p>
                </body>
              </html>
              HTML
              EOF
  )

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "${var.project_name}-EC2-ASG"
    }
  }
}

#############################################
# AUTO SCALING GROUP
# O que cria:
# - Grupo de escalabilidade automatica
# Para que serve:
# - Manter varias instancias disponiveis
# - Integrar com o ALB
# O que faz:
# - Cria instancias em multiplas AZs
# - Mantem capacidade minima
# - Pode crescer e reduzir
#############################################
resource "aws_autoscaling_group" "app_asg" {
  name                = "${var.project_name}-ASG"
  desired_capacity    = 2
  min_size            = 2
  max_size            = 4
  vpc_zone_identifier = var.private_subnet_ids
  target_group_arns   = [var.target_group_arn]
  health_check_type   = "ELB"

  launch_template {
    id      = aws_launch_template.app_lt.id
    version = "$Latest"
  }

  tag {
    key                 = "Name"
    value               = "${var.project_name}-EC2-ASG"
    propagate_at_launch = true
  }
}