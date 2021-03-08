# Here is 2 instances created, 1 public and 1 private. 
resource "aws_instance" "public-web" {
  ami           = "ami-0915bcb5fa77e4892"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.public1.id
  tags = {
    "Name" = "publicInstance"
  }
  #   key_name = aws_key_pair.deployer_key.key_name
  #   security_groups = aws_security_group.sg.id
}

resource "aws_instance" "private-web" {
  ami           = "ami-0915bcb5fa77e4892"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.private1.id
  tags = {
    "Name" = "privateInstance"
  }
  #   key_name = aws_key_pair.deployer_key.key_name
  #   security_groups = aws_security_group.sg.id
}