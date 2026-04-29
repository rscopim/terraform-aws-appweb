# OUTPUTS

output "vpc_id" {
  description = "ID da VPC"
  value       = aws_vpc.main.id
}
output "public_subnets" {
  value = aws_subnet.public[*].id
}

output "private_subnets" {
  value = aws_subnet.private[*].id
}

output "private_route_table_id" {
  value = aws_route_table.private.id
}

output "internet_gateway_id" {
  value = aws_internet_gateway.igw.id
}
