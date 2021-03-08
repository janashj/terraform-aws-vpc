output "vpc_id" {
  value = aws_vpc.main.id
}
output "public_subnets" {
  value = [
    aws_subnet.public1.id,
    aws_subnet.public2.id,
    aws_subnet.public3.id
  ]
}
output "private_subnets" {
  value = [
    aws_subnet.private1.id,
    aws_subnet.private2.id,
    aws_subnet.private3.id
  ]
}
output "region" {
  value = var.region
}
output "igw_id" {
  value = aws_internet_gateway.igw.id
}
output "nat_gw_id" {
  value = aws_nat_gateway.ngw.id
}
