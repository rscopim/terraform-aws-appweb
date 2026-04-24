# BUCKET S3
resource "aws_s3_bucket" "bucket" {
  bucket = "${var.project_name_safe}-bucket-${random_id.suffix.hex}"

  force_destroy = true

  tags = merge(var.common_tags, {
    Name = "${var.project_name}-S3"
  })
}

# RANDOM PARA NOME ÚNICO
resource "random_id" "suffix" {
  byte_length = 4
}