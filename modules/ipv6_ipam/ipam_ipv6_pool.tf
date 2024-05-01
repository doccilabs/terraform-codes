data "aws_region" "current" {

}

resource "aws_vpc_ipam" "main" {
  operating_regions {
    region_name = data.aws_region.current.name
  }

  cascade     = true
  description = var.vpc_ipam_description
}

resource "aws_vpc_ipam_pool" "ipv6_pool" {
  ipam_scope_id  = aws_vpc_ipam.main.public_default_scope_id
  aws_service    = "ec2"
  locale         = data.aws_region.current.name
  address_family = "ipv6"
  description    = var.ipam_pool_description

  allocation_default_netmask_length = var.allocation_default_netmask_length
  allocation_max_netmask_length     = var.allocation_max_netmask_length
  allocation_min_netmask_length     = var.allocation_min_netmask_length

  publicly_advertisable = true
  public_ip_source      = "amazon"

  tags = merge(
    local.common_tags,
    var.tags
  )
}

resource "aws_vpc_ipam_pool_cidr" "ipv6" {
  ipam_pool_id   = aws_vpc_ipam_pool.ipv6_pool.id
  netmask_length = 52
}