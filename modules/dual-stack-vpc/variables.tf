# Common
variable "tags" {
  type        = map(string)
  default     = {}
  description = "VPC tags"
}

# VPC Variables
variable "vpc_name" {
  type        = string
  description = "Vpc name"
}

variable "ipv6_ipam_pool_id" {
  type        = string
  description = "(Required) ipv6 ipam pool의 id 정보입니다."
}


variable "cidr_block_ipv4" {
  type        = string
  description = "The IPv4 CIDR block for the VPC. CIDR can be explicitly set or it can be derived from IPAM using ipv4_netmask_length"
}

variable "cidr_block_ipv6" {
  type        = string
  description = "pool에 할당된 cidr 블록 범위 내로 정의하셔야합니다. 일반적으로 56 크기의 cidr을 허용합니다."
}

variable "instance_tenancy" {
  type        = string
  default     = "default"
  description = "A tenancy option for instances launched into the VPC. Default is default, which ensures that EC2 instances launched in this VPC use the EC2 instance tenancy attribute specified when the EC2 instance is launched. The only other option is dedicated, which ensures that EC2 instances launched in this VPC are run on dedicated tenancy instances regardless of the tenancy attribute specified at launch. This has a dedicated per region fee of $2 per hour, plus an hourly per instance usage fee."
}