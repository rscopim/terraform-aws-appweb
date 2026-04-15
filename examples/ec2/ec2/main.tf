#############################################
# DATA SOURCE - AMI AMAZON LINUX
# O que faz:
# - Busca a AMI mais recente do Amazon Linux 2
# Para que serve:
# - Evita hardcode de AMI
# Recurso ligado:
# - aws_instance.web
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
# SECURITY GROUP DA EC2
# O que cria:
# - Firewall da EC2
# Para que serve:
# - Liberar SSH e HTTP
# Recurso ligado:
# - aws_instance.web
#############################################
resource "aws_security_group" "ec2_sg" {
  name        = "${var.project_name}-EC2-SG"
  description = "Security Group da EC2 AppWeb"
  vpc_id      = var.vpc_id

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Saida liberada"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.project_name}-EC2-SG"
  }
}

#############################################
# INSTÂNCIA EC2
# O que cria:
# - Uma instância EC2 com servidor web
# Para que serve:
# - Rodar a aplicação inicial
# O que faz:
# - Usa a subnet da VPC
# - Usa o SG acima
# - Usa o Instance Profile da fase IAM
# - Instala Apache
# - Cria uma página index.html
# Recurso ligado:
# - Security Group
# - IAM Instance Profile
# - S3 bucket (via variável mostrada na página)
#############################################
resource "aws_instance" "web" {
  ami                    = data.aws_ami.amazon_linux.id
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]
  iam_instance_profile   = var.instance_profile_name

  user_data = <<-EOF
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
                  <p>Servidor web criado com Terraform.</p>
                  <p>Bucket S3 vinculado: ${var.bucket_name}</p>
                </body>
              </html>
              HTML
              EOF

  tags = {
    Name = "${var.project_name}-EC2"
  }
}