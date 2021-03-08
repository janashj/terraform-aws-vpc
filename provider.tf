provider "aws" {
  region = "us-east-1"
}

data "aws_availability_zones" "az_avail" {
  state = "available"
}

output "AZ" {
  value = data.aws_availability_zones.az_avail.names
}