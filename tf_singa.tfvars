region         = "ap-southeast-1"
cidr_block = "172.16.0.0/16"
public_cidr1   = "172.16.101.0/24"
public_cidr2   = "172.16.102.0/24"
public_cidr3   = "172.16.103.0/24"
private_cidr1  = "172.16.1.0/24"
private_cidr2  = "172.16.2.0/24"
private_cidr3  = "172.16.3.0/24"
tags = {
  Name    = "VPC"
  Team    = "DevOps"
  Billing = "CFO"
  Quarter = "3"
  AppName = "Wordpress"
}