output "vpcid" {
  value = aws_vpc.vpc.id
}

output "natgwid" {
  value = aws_nat_gateway.nat_gw.id
}