variable "aws_region" {
  default = "sa-east-1"
}

variable "cluster-name" {
  default = "terraform-eks"
  type    = string
}

variable "role-cluster-name" {
  default = "terraform-eks-cluster"
  type    = string
}

variable "node-name" {
  default = "terraform-eks-node"
  type    = string
}

variable "role-node-group-name" {
  default = "terraform-eks-node-group"
  type    = string
}
