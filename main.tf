provider "aws" { 
  version = "~> 2.0" 
  region  = "us-south-1" 
} 
 
resource "aws_vpc" "main" { 
  cidr_block       = "10.0.0.0/16" 
  instance_tenancy = "dedicated" 
 
  tags = { 
    Name = "main" 
  } 
} 
