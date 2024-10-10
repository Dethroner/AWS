variable "region" {
  description = "AWS region"
  default = "eu-central-1"
}

variable "vpc_name" {
  default = "nonprod"
}

variable "eks_cluster_name" {
  default = "nonprod"
}

variable "cidr" {
  default = "10.79.54.0/24"
}

variable "public_subnets" {
  default = ["100.100.50.0/28"]
}

variable "private_subnets" {
  default = ["10.79.54.0/25", "10.79.54.128/25"]
}

variable "bucket_name" {
  default     = "IaC-states"
  description = "bucket name"
}