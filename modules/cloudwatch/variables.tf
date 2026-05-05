variable "project_name" {
  description = "Nome visual do projeto"
  type        = string
}

variable "project_name_safe" {
  description = "Nome tecnico seguro do projeto"
  type        = string
}

variable "common_tags" {
  description = "Tags padrao"
  type        = map(string)
}

variable "log_retention_days" {
  description = "Quantidade de dias para reter logs no CloudWatch"
  type        = number
}

variable "autoscaling_group_name" {
  description = "Nome do Auto Scaling Group monitorado"
  type        = string
}

variable "alb_arn_suffix" {
  description = "ARN suffix do ALB para metricas do CloudWatch"
  type        = string
}

variable "target_group_arn_suffix" {
  description = "ARN suffix do Target Group para metricas do CloudWatch"
  type        = string
}

variable "cpu_alarm_threshold" {
  description = "Limite de CPU para disparar alarme"
  type        = number
}

variable "unhealthy_hosts_threshold" {
  description = "Quantidade de hosts nao saudaveis para disparar alarme"
  type        = number
}

variable "alb_5xx_threshold" {
  description = "Quantidade de erros 5XX do ALB para disparar alarme"
  type        = number
}

variable "alarm_actions" {
  description = "Lista de ARNs acionados quando alarmes entram em ALARM"
  type        = list(string)
  default     = []
}

variable "ok_actions" {
  description = "Lista de ARNs acionados quando alarmes voltam para OK"
  type        = list(string)
  default     = []
}