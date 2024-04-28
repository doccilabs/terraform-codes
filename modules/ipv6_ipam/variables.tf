# Common
variable "tags" {
    type = map(string)
    default = {}
    description = "VPC tags"
}

# IPAM
variable "allocation_default_netmask_length" {
    type = number
    default = 64
    description = "할당 가능한 netmask의 기본 길이를 정의합니다. 기본 값은 64 입니다."
}

variable "allocation_max_netmask_length" {
  type        = number
  default     = 112
  description = "할당 가능한 netmask의 최대 길이를 정의합니다. 기본 값은 112 입니다."
}

variable "allocation_min_netmask_length" {
    type = number
    default = 52
    description = "할당 가능한 netmask의 최소 길이를 정의합니다. AWS에서는 cidr netmask length 기본값이 52이기 때문에 기본값은 52 입니다."
}

variable "vpc_ipam_description" {
    type = string
    default = "AWS VPC IPAM generated by brian"
    description = "AWS VPC IPAM description"
}

variable "ipam_pool_description" {
    type = string
    default = "AWS IPAM pool generated by brian"
    description = "AWS IPAM pool description"
}