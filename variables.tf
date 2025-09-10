variable "access_key" {
  description = "AWS Access Key"
  type        = string
}

variable "secret_key" {
  description = "AWS Secret Key"
  type        = string
}

variable "instance_type" {
  description = "Type of EC2 instance"
  type        = string
  default     = "t2.micro"  # puedes dar un valor por defecto
}

variable "instance_name" {
  description = "Name of the EC2 instance"
  type        = string
}

variable "region" {
  description = "AWS region to deploy"
  type        = string
  default     = "us-east-1"
}
