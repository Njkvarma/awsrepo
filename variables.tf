variable "aws_region" {
  description = "AWS region"
  default     = "us-east-1"
}

variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr_block_1" {
  description = "CIDR block for the first public subnet"
  default     = "10.0.1.0/24"
}

variable "public_subnet_cidr_block_2" {
  description = "CIDR block for the second public subnet"
  default     = "10.0.2.0/24"
}

variable "private_subnet_cidr_block_1" {
  description = "CIDR block for the first private subnet"
  default     = "10.0.3.0/24"
}

variable "private_subnet_cidr_block_2" {
  description = "CIDR block for the second private subnet"
  default     = "10.0.4.0/24"
}

variable "public_subnet_az_1" {
  description = "Availability Zone for the first public subnet"
  default     = "us-east-1a"
}

variable "public_subnet_az_2" {
  description = "Availability Zone for the second public subnet"
  default     = "us-east-1b"
}

variable "private_subnet_az_1" {
  description = "Availability Zone for the first private subnet"
  default     = "us-east-1a"
}

variable "private_subnet_az_2" {
  description = "Availability Zone for the second private subnet"
  default     = "us-east-1b"
}
