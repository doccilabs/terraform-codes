locals {
  common_tags = {
    project = "miracle-sprinters"
    Owner   = "brian"
  }
}

module "eks-dev" {
  source  = "terraform-aws-modules/eks/aws"
  version = "18.26.6"

  cluster_name    = var.cluster_name
  cluster_version = var.cluster_version

  vpc_id     = data.terraform_remote_state.vpc.outputs.vpc_id
  subnet_ids = data.terraform_remote_state.vpc.outputs.subnet_groups.public

  eks_managed_node_groups = {
    default_node_group = {
      desired_size   = 2
      min_size       = 2
      max_size       = 6
      instance_types = ["t3.medium"]
    }
  }

  node_security_group_additional_rules = {
    alb_controller_webhook_rule = {
      description                   = "Cluster API to AWS LB Controller webhook"
      protocol                      = "all"
      from_port                     = 9443
      to_port                       = 9443
      type                          = "ingress"
      source_cluster_security_group = true
    }
    allow_http_ingress_rule = {
      description = "Allow HTTP input from outside"
      protocol    = "TCP"
      from_port   = 80
      to_port     = 80
      type        = "ingress"
      cidr_blocks = ["0.0.0.0/0"]
    }
    allow_https_ingress_rule = {
      description = "Allow HTTPS input from outside"
      protocol    = "TCP"
      from_port   = 443
      to_port     = 443
      type        = "ingress"
      cidr_blocks = ["0.0.0.0/0"]
    }
    allow_local_ingress_rule = {
      description = "Allow all of local ingress rules"
      protocol    = "TCP"
      from_port   = 0
      to_port     = 65535
      type        = "ingress"
      cidr_blocks = ["10.0.0.0/16"]
    }
    cluster_api_to_control_plane = {
      description                   = "Cluster API to Control Plane"
      protocol                      = "all"
      from_port                     = 0
      to_port                       = 65535
      type                          = "egress"
      source_cluster_security_group = true
    }
    allow_http_egress_rule = {
      description = "Allow HTTP output from inbound"
      protocol    = "TCP"
      from_port   = 80
      to_port     = 80
      type        = "egress"
      cidr_blocks = ["0.0.0.0/0"]
    }
    allow_local_egress_rule = {
      description = "Allow all of local egress rules"
      protocol    = "TCP"
      from_port   = 0
      to_port     = 65535
      type        = "egress"
      cidr_blocks = ["10.0.0.0/16"]
    }
  }

  tags = local.common_tags
}