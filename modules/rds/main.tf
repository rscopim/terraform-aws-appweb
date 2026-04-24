# DB SUBNET GROUP
resource "aws_db_subnet_group" "db_subnet" {
  name       = "${var.project_name_safe}-db-subnet"
  subnet_ids = var.subnet_ids

  tags = merge(var.common_tags, {
    Name = "${var.project_name}-DB-Subnet"
  })
}

# SECURITY GROUP DO RDS
resource "aws_security_group" "rds_sg" {
  name        = "${var.project_name}-RDS-SG"
  description = "Acesso ao RDS"
  vpc_id      = var.vpc_id

  ingress {
    description     = "Acesso MySQL da aplicacao"
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = [var.app_security_group_id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# RDS INSTANCE
resource "aws_db_instance" "rds" {
  identifier = "${var.project_name_safe}-rds"

  engine         = "mysql"
  engine_version = "8.0"

  instance_class = "db.t3.micro"

  allocated_storage = 20

  username = var.db_username
  password = var.db_password

  db_subnet_group_name   = aws_db_subnet_group.db_subnet.name
  vpc_security_group_ids = [aws_security_group.rds_sg.id]

  publicly_accessible = false
  skip_final_snapshot = true

  tags = merge(var.common_tags, {
    Name = "${var.project_name}-RDS"
  })
}