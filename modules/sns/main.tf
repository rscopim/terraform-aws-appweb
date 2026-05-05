resource "aws_sns_topic" "alerts" {
  name = "${var.project_name_safe}-alerts"

  tags = merge(var.common_tags, {
    Name = "${var.project_name}-Alerts"
  })
}

resource "aws_sns_topic_subscription" "email" {
  topic_arn = aws_sns_topic.alerts.arn
  protocol  = "email"
  endpoint  = var.alert_email
}