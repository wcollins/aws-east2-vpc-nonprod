# Add a comment
locals {
  vpc_subnets = flatten([
    for vpc_key, vpc in local.vpcs : [
      for subnet_key, subnet in vpc.subnets : {
        vpc_key           = vpc_key
        subnet_key        = subnet_key
        vpc_id            = aws_vpc.this[vpc_key].id
        subnet_name       = subnet.name
        cidr_block        = subnet.cidr_block
        availability_zone = subnet.availability_zone
        public            = subnet.public
      }
    ]
  ])
}

resource "aws_vpc" "this" {
  for_each = local.vpcs

  cidr_block    = each.value.cidr_block

  tags = {
    Name        = each.value.name
    Environment = each.key
  }

}

resource "aws_subnet" "this" {
  for_each = {
    for item in local.vpc_subnets : "${item.vpc_key}-${item.subnet_key}" => item
  }

  vpc_id                  = each.value.vpc_id
  cidr_block              = each.value.cidr_block
  availability_zone       = each.value.availability_zone

  tags = {
    Name   = each.value.subnet_name
    Type   = each.value.public ? "public" : "private"
    VPC    = each.value.vpc_key
  }

}