output "vpc_ids" {
  value = {
    for k, v in aws_vpc.this : k => v.id
  }
}

output "subnet_ids" {
  value = {
    for k, v in aws_subnet.this : k => v.id
  }
}

output "vpc_cidr_blocks" {
  value = {
    for k, v in aws_vpc.this : k => v.cidr_block
  }
}

output "public_subnet_ids" {
  value = {
    for k, v in aws_subnet.this : k => v.id
    if can(regex("-public-", v.tags.Name))
  }
}

output "private_subnet_ids" {
  value = {
    for k, v in aws_subnet.this : k => v.id
    if can(regex("-private-", v.tags.Name))
  }
}