terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }
  required_version = ">= 1.2.0"
}

provider "aws" {
  region     = "us-east-1"
  access_key = "AKIA2UC3BVFTDFSJ6A4T"
  secret_key = "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"
}

# Crear VPC
resource "aws_vpc" "test_vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "test-vpc"
  }
}

# Crear Subnet pública
resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.test_vpc.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true

  tags = {
    Name = "public-subnet"
  }
}

# Crear EC2 directamente
resource "aws_instance" "my_ec2" {
  ami           = "ami-00ca32bbc84273381" # Amazon Linux 2
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.public.id

  tags = {
    Name = "test-ec2"
  }
}

# Outputs
output "vpc_id" {
  value = aws_vpc.test_vpc.id
}

output "subnet_id" {
  value = aws_subnet.public.id
}

output "ec2_id" {
  value = aws_instance.my_ec2.id
}
