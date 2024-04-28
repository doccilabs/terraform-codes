module "vpc" {
    source = "../../modules/dual-stack-vpc"

    vpc_name = var.vpc_name
    cidr_block_ipv4 = var.cidr_block_ipv4

    ipv6_ipam_pool_id = var.ipv6_ipam_pool_id   
    cidr_block_ipv6 = var.cidr_block_ipv6

    instance_tenancy = var.instance_tenancy

    tags = {
        Name = "Brian-dual-stack-vpc",
        Description = "듀얼스택으로 구성된 VPC 입니다."
    }
}