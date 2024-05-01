resource "aws_vpc" "main" {
  cidr_block = var.cidr_block_ipv4

  ipv6_cidr_block   = var.cidr_block_ipv6
  ipv6_ipam_pool_id = var.ipv6_ipam_pool_id

  instance_tenancy = var.instance_tenancy

  tags = merge(
    local.common_tags,
    var.tags
  )
}