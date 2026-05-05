# CLOUDWATCH LOG GROUP
resource "aws_cloudwatch_log_group" "app" {
  name              = "/${var.project_name_safe}/app"
  retention_in_days = var.log_retention_days

  tags = merge(var.common_tags, {
    Name = "${var.project_name}-LogGroup"
  })
}

# ALARME - CPU ALTA NO AUTO SCALING GROUP
resource "aws_cloudwatch_metric_alarm" "asg_cpu_high" {
  alarm_name          = "${var.project_name_safe}-asg-cpu-high"
  alarm_description   = "CPU alta nas instancias do Auto Scaling Group"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 60
  statistic           = "Average"
  threshold           = var.cpu_alarm_threshold
  treat_missing_data  = "notBreaching"
  alarm_actions       = var.alarm_actions
  ok_actions          = var.ok_actions

  dimensions = {
    AutoScalingGroupName = var.autoscaling_group_name
  }

  tags = merge(var.common_tags, {
    Name = "${var.project_name}-ASG-CPU-High"
  })
}

# ALARME - ERROS 5XX NO ALB
resource "aws_cloudwatch_metric_alarm" "alb_5xx" {
  alarm_name          = "${var.project_name_safe}-alb-5xx-errors"
  alarm_description   = "Erros HTTP 5XX gerados pelo Application Load Balancer"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 1
  metric_name         = "HTTPCode_ELB_5XX_Count"
  namespace           = "AWS/ApplicationELB"
  period              = 60
  statistic           = "Sum"
  threshold           = var.alb_5xx_threshold
  treat_missing_data  = "notBreaching"
  alarm_actions       = var.alarm_actions
  ok_actions          = var.ok_actions

  dimensions = {
    LoadBalancer = var.alb_arn_suffix
  }

  tags = merge(var.common_tags, {
    Name = "${var.project_name}-ALB-5XX"
  })
}

# ALARME - TARGETS NAO SAUDAVEIS
resource "aws_cloudwatch_metric_alarm" "target_unhealthy" {
  alarm_name          = "${var.project_name_safe}-target-unhealthy"
  alarm_description   = "Targets nao saudaveis no Target Group"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 2
  metric_name         = "UnHealthyHostCount"
  namespace           = "AWS/ApplicationELB"
  period              = 60
  statistic           = "Average"
  threshold           = var.unhealthy_hosts_threshold
  treat_missing_data  = "notBreaching"
  alarm_actions       = var.alarm_actions
  ok_actions          = var.ok_actions

  dimensions = {
    TargetGroup  = var.target_group_arn_suffix
    LoadBalancer = var.alb_arn_suffix
  }

  tags = merge(var.common_tags, {
    Name = "${var.project_name}-Target-Unhealthy"
  })
}