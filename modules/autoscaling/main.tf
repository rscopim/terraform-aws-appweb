# DATA SOURCE - AMI AMAZON LINUX
# O que faz: Busca a AMI mais recente

data "aws_ami" "amazon_linux" {
  most_recent = true

  owners = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

# LOCALS
# O que faz: Monta o conteúdo HTML a partir de um template
# Para que serve: Separar o HTML do user_data
locals {
  html_content = templatefile("${path.module}/templates/index.html.tpl", {
    project_name      = var.project_name
    bucket_name       = var.bucket_name
    instance_hostname = "$HOSTNAME"
    linkedin_url      = var.linkedin_url
    github_url        = var.github_url
  })

  css_content = templatefile("${path.module}/templates/style.css.tpl", {})
}
# LAUNCH TEMPLATE
# O que cria: Modelo de configuracao das instancias
# Para que serve: Servir de base para o Auto Scaling Group
resource "aws_launch_template" "app_lt" {
  name_prefix   = "${var.project_name}-LT-"
  image_id      = data.aws_ami.amazon_linux.id
  instance_type = var.instance_type

  vpc_security_group_ids = [var.security_group_id]

  iam_instance_profile {
    name = var.instance_profile_name
  }

    user_data = base64encode(templatefile("${path.module}/templates/user_data.sh.tpl", {
    html_content = local.html_content
    css_content  = local.css_content
  }))

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "${var.project_name}-EC2-ASG"
    }
  }
}

# AUTO SCALING GROUP
# O que cria: Grupo de escalabilidade automatica
# Para que serve: Manter varias instancias disponiveis
resource "aws_autoscaling_group" "app_asg" {
  name                = "${var.project_name}-ASG"
  desired_capacity    = var.asg_desired_capacity
  min_size            = var.asg_min_size
  max_size            = var.asg_max_size
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