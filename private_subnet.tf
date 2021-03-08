# Creating private subnets
resource "aws_subnet" "private1" {
  vpc_id            = aws_vpc.main.id
  cidr_block    = var.private_cidr1
  availability_zone = data.aws_availability_zones.az_avail.names[0]
  tags              = var.tags

}
resource "aws_subnet" "private2" {
  vpc_id            = aws_vpc.main.id
  cidr_block    = var.private_cidr2
  availability_zone = data.aws_availability_zones.az_avail.names[1]
  tags              = var.tags
}

resource "aws_subnet" "private3" {
  vpc_id            = aws_vpc.main.id
  cidr_block    = var.private_cidr3
  availability_zone = data.aws_availability_zones.az_avail.names[2]
  tags              = var.tags
}

resource "aws_route_table" "private-rt" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.ngw.id
  }
  tags = var.tags
}

resource "aws_route_table_association" "private1" {
  subnet_id      = aws_subnet.private1.id
  route_table_id = aws_route_table.private-rt.id
}
resource "aws_route_table_association" "private2" {
  subnet_id      = aws_subnet.private2.id
  route_table_id = aws_route_table.private-rt.id
}
resource "aws_route_table_association" "private3" {
  subnet_id      = aws_subnet.private3.id
  route_table_id = aws_route_table.private-rt.id
}

