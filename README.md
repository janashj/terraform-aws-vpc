# terraform-aws-vpc
This module creates AWS VPC along with private/public subnets, IGW, NAT, 

You can use below module in 2 different ways. 
1) You can create your own .tf file, copy and paste this module in it and give values directly to variables for desired region with desired cidrs as below:
```
module "vpc" {
  source  = "github.com/janashj/terraform-aws-vpc"
  region = "us-east-1"
  cidr_block = "10.0.0.0/16"
  public_cidr1 = "10.0.1.0/24"
  public_cidr2 = "10.0.2.0/24"
  public_cidr3 = "10.0.3.0/24"
  private_cidr1 = "10.0.101.0/24"
  private_cidr2 = "10.0.102.0/24"
  private_cidr3 = "10.0.103.0/24"
  tags    =   {
    Name                    =   "VPC_Project"
    Environment             =   "Dev"
    Team                    =   "DevOps"
   }
}
```

2) or, in this case you have to create 3 files, 1 module.tf, 1 region.tfvars, 1 variables.tf. 
Copy and paste below codes to those 3 files:

module.tf:
```
module "vpc" {
source        = "github.com/janashj/terraform-aws-vpc"
region        = var.region
cidr_block    = var.cidr_block
public_cidr1  = var.public_cidr1
public_cidr2  = var.public_cidr2
public_cidr3  = var.public_cidr3
private_cidr1 = var.private_cidr1
private_cidr2 = var.private_cidr2
private_cidr3 = var.private_cidr3
tags          = var.tags
}
```
region.tfvars:
```
region        = "us-east-1"
cidr_block    = "10.0.0.0/16"
public_cidr1  = "10.0.101.0/24"
public_cidr2  = "10.0.102.0/24"
public_cidr3  = "10.0.103.0/24"
private_cidr1 = "10.0.1.0/24"
private_cidr2 = "10.0.2.0/24"
private_cidr3 = "10.0.3.0/24"
tags = {
  Name    = "VPC"
  Team    = "DevOps"
}
```
variables.tf:
```
variable "region" {}
variable "cidr_block" {}
variable "public_cidr1" {}
variable "public_cidr2" {}
variable "public_cidr3" {}
variable "private_cidr1" {}
variable "private_cidr2" {}
variable "private_cidr3" {}
variable "tags" {
  type = map(string)
} 
```

/* module cant pull the value of each resource, so if we want to
use output, then output.tf file should be created first. 
Optionally, you can copy and paste below code inside your module.tf file for outputs.
##### Note: output.tf file is created in the repository, so no need to create here, go ahead with pasting this code if you need outputs. 

*/
```
output "vpc_id" {
  value = module.vpc.vpc_id
}
output "public_subnets" {
  value = module.vpc.public_subnets
}
output "private_subnets" {
  value = module.vpc.private_subnets
}
output "region" {
  value = module.vpc.region
}
output "igw" {
  value = module.vpc.igw_id
}
output "ngw" {
  value = module.vpc.nat_gw_id
}

}
```

# To run:

With 1st option you have to run:
##### terraform init
##### terraform apply
______

With 2nd option you have to run:
##### terraform init
##### terraform apply -var-file region.tfvars

_____________________
###### Please note: this module creates 2 instances for private/public subnets. In order to avoid them in future use, delete or comment it out in ec2.tf folder once module is pulled. 


