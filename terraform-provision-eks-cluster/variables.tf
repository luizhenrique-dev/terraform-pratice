variable "aws-region" {
  default     = "sa-east-1"
  description = "AWS region"
}

variable "cluster-name" {
  default = "terraform-eks-demo"
  type    = string
}
