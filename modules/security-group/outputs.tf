# OUTPUTS DO SECURITY GROUP

output "security_group_id" {
  value = aws_security_group.app_sg.id
}