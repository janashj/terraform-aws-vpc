resource "aws_eip" "nat" {
  vpc  = true
  tags = var.tags
}

resource "aws_nat_gateway" "ngw" {
  depends_on    = [aws_internet_gateway.igw]
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public1.id
  tags          = var.tags
}
