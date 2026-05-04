# CLOUDWATCH LOG GROUP
resource "aws_cloudwatch_log_group" "app" {
  name              = "/${var.project_name_safe}/app"
  retention_in_days = var.log_retention_days

  tags = merge(var.common_tags, {
    Name = "${var.project_name}-LogGroup"
  })
}