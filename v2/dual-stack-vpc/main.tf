module "vpc" {
  source = "../../modules/dual-stack-vpc"

  vpc_name        = var.vpc_name
  cidr_block_ipv4 = var.cidr_block_ipv4

  ipv6_ipam_pool_id = var.ipv6_ipam_pool_id
  cidr_block_ipv6   = var.cidr_block_ipv6

  instance_tenancy = var.instance_tenancy

  tags = {
    Name        = "Brian-dual-stack-vpc",
    Description = "듀얼스택으로 구성된 VPC 입니다."
  }
}

module "public_dual_subnet_az01" {
  source = "../../modules/subnet"

  vpc_id         = module.vpc.id
  available_zone = var.available_zone_01

  is_public_subnet = true

  cidr_block      = var.subnet_cidr_block_01
  ipv6_cidr_block = var.subnet_ipv6_cidr_block_01

  tags = {
    Name        = "Brian-dual-stack-public-dual-subnet-01"
    Description = "듀얼스택으로 구성된 az01의 subnet 입니다"
  }
}

module "public_single_stack_subnet_az01" {
  source = "../../modules/subnet"

  vpc_id         = module.vpc.id
  available_zone = var.available_zone_01

  is_public_subnet = true

  cidr_block = var.subnet_cidr_block_02

  tags = {
    Name        = "Brian-single-stack-public-dual-subnet-01"
    Description = "싱글스택으로 구성된 az01의 subnet 입니다"
  }
}

module "private_dual_subnet_az03" {
  source = "../../modules/subnet"

  vpc_id         = module.vpc.id
  available_zone = var.available_zone_03

  is_public_subnet = false

  cidr_block      = var.subnet_cidr_block_03
  ipv6_cidr_block = var.subnet_ipv6_cidr_block_02

  tags = {
    Name        = "Brian-dual-stack-private-dual-subnet-03"
    Description = "듀얼스택으로 구성된 az03의 사설 subnet 입니다"
  }
}

module "private_single_stack_subnet_az03" {
  source = "../../modules/subnet"

  vpc_id         = module.vpc.id
  available_zone = var.available_zone_03

  is_public_subnet = false

  cidr_block = var.subnet_cidr_block_04

  tags = {
    Name        = "Brian-single-stack-private-dual-subnet-03"
    Description = "싱글스택으로 구성된 az03의 사설 subnet 입니다"
  }
}
