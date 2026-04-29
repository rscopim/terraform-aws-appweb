# ELASTIC IP DO NAT GATEWAY
resource "aws_eip" "nat" {
  domain = "vpc"

  tags = merge(var.common_tags, {
    Name = "${var.project_name}-NAT-EIP"
  })
}

# NAT GATEWAY
resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat.id
  subnet_id     = var.public_subnet_id

  tags = merge(var.common_tags, {
    Name = "${var.project_name}-NAT"
  })

  depends_on = [var.internet_gateway_id]
}

# ROTA PRIVADA PARA INTERNET VIA NAT
resource "aws_route" "private_internet" {
  route_table_id         = var.private_route_table_id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.nat.id
}