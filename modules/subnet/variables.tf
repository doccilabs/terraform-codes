variable "vpc_id" {
  type        = string
  description = "vpc id"
}

variable "available_zone" {
  type        = string
  description = "available zone subnet will be applied"
}

variable "cidr_block" {
  type        = string
  description = "ipv4 cidr_block"
}

variable "ipv6_cidr_block" {
  type        = string
  default     = null
  description = "ipv6 cidr_block"
}

variable "is_public_subnet" {
  type        = bool
  default     = false
  description = "Indicates whether instances in a subnet should be assigned a public IP."
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "subnet tags"
}