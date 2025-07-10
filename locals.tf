locals {
  vpcs = {
    vpc1 = {
      name       = "dev-vpc"
      cidr_block = "10.0.0.0/16"
      subnets = {
        subnet1 = {
          name              = "dev-public-subnet-1"
          cidr_block        = "10.0.1.0/24"
          availability_zone = "us-east-2a"
          public            = true
        }
        subnet2 = {
          name              = "dev-public-subnet-2"
          cidr_block        = "10.0.2.0/24"
          availability_zone = "us-east-2a"
          public            = true
        }
        subnet3 = {
          name              = "dev-private-subnet-1"
          cidr_block        = "10.0.11.0/24"
          availability_zone = "us-east-2a"
          public            = false
        }
        subnet4 = {
          name              = "dev-private-subnet-2"
          cidr_block        = "10.0.12.0/24"
          availability_zone = "us-east-2a"
          public            = false
        }
      }
    }
    vpc2 = {
      name       = "qa-vpc"
      cidr_block = "10.1.0.0/16"
      subnets = {
        subnet1 = {
          name              = "qa-public-subnet-1"
          cidr_block        = "10.1.1.0/24"
          availability_zone = "us-east-2a"
          public            = true
        }
        subnet2 = {
          name              = "qa-public-subnet-2"
          cidr_block        = "10.1.2.0/24"
          availability_zone = "us-east-2a"
          public            = true
        }
        subnet3 = {
          name              = "qa-private-subnet-1"
          cidr_block        = "10.1.11.0/24"
          availability_zone = "us-east-2a"
          public            = false
        }
        subnet4 = {
          name              = "qa-private-subnet-2"
          cidr_block        = "10.1.12.0/24"
          availability_zone = "us-east-2a"
          public            = false
        }
      }
    }
  }
}