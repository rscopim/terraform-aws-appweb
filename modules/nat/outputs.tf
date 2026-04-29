output "nat_gateway_id" {
  description = "ID do NAT Gateway"
  value       = aws_nat_gateway.nat.id
}

output "nat_eip" {
  description = "Elastic IP associado ao NAT Gateway"
  value       = aws_eip.nat.public_ip
}