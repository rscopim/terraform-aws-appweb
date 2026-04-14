#############################################
# BUCKET S3
#############################################

resource "aws_s3_bucket" "bucket" {
  bucket = "${lower(var.project_name)}-bucket-${random_id.suffix.hex}"

  tags = {
    Name = "${var.project_name}-S3"
  }
}

#############################################
# RANDOM PARA NOME ÚNICO
#############################################

resource "random_id" "suffix" {
  byte_length = 4
}