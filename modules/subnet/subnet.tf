resource "aws_subnet" "main" {
  vpc_id                  = var.vpc_id
  availability_zone       = var.available_zone
  cidr_block              = var.cidr_block
  map_public_ip_on_launch = var.is_public_subnet

  ipv6_cidr_block                 = var.ipv6_cidr_block != null ? var.ipv6_cidr_block : null
  assign_ipv6_address_on_creation = var.ipv6_cidr_block != null ? true : false

  tags = merge(
    local.common_tags,
    var.tags
  )
}