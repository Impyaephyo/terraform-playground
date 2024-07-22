variable "region" {
  default     = "ap-southeast-1"
  description = "Singapore region"
  type        = string
}
variable "vpc_cidr" {
  type        = string
  description = "VPC CIDR block"
  default     = "10.1.0.0/16"
}

variable "availability_zones" {
  type        = list(string)
  description = "Availability Zones"
  default     = ["ap-southeast-1a", "ap-southeast-1b"]
}

variable "public_subnet_cidrs" {
  type        = list(string)
  description = "Public Subnet CIDR values"
  default     = ["10.1.0.0/24", "10.1.1.0/24"]
}

variable "private_subnet_cidrs" {
  type        = list(string)
  description = "Private Subnet CIDR values"
  default     = ["10.1.2.0/24", "10.1.3.0/24"]
}

variable "tags" {
  type        = map(string)
  description = "Tags for resources"
  default = {
    "Name" = "Terraform"
  }
}

variable "ami_id" {
  type        = string
  description = "AMI for ap-southeast-1"
  default     = "ami-09005bce47e1d2c7f"
}

variable "instance_type" {
  type        = string
  description = "Instance Type"
  default     = "t2.micro"
}

variable "key_name" {
  type        = string
  description = "Key Pair Name"
  default     = "KP-Lab"
}