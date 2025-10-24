resource "aws_vpc" "this" {
  cidr_block = var.cidr_block
  tags = {
    Name = "${var.project}-vpc"
  }
}

resource "aws_subnet" "public" {
  for_each = toset(var.public_subnets)
  vpc_id = aws_vpc.this.id
  cidr_block = each.value
  map_public_ip_on_launch = true
  availability_zone = var.azs[0]
  tags = { Name = "${var.project}-public-${replace(each.value, "/", "-")}" }
}

resource "aws_subnet" "private" {
  for_each = toset(var.private_subnets)
  vpc_id = aws_vpc.this.id
  cidr_block = each.value
  availability_zone = var.azs[1]
  tags = { Name = "${var.project}-private-${replace(each.value, "/", "-")}" }
}

output "vpc_id" { value = aws_vpc.this.id }
output "public_subnet_ids" { value = [for s in aws_subnet.public : s.id] }
output "private_subnet_ids" { value = [for s in aws_subnet.private : s.id] }
