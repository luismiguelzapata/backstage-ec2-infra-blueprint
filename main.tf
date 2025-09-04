terraform {
  #   backend "remote" {
  #     organization = "sanjeevkt720"

  #     workspaces {
  #       name = "infrastructure-iac"
  #     }
  #   }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "us-east-1"
}
data "terraform_remote_state" "core" {
  backend = "remote"

  config = {
    organization = "sanjeevkt720"
    workspaces = {
      name = "infrastructure-iac"
    }
  }
}

# data "tfe_outputs" "core" {
#   organization = "sanjeevkt720"
#   workspace    = "infrastructure-iac"
# }

module "my_ec2" {
  source        = "app.terraform.io/sanjeevkt720/ec2-infra/aws"
  version       = "1.0.0"
  name          = "${{ values.name }}"
  instance_type = "${{ values.instanceType }}"
  #   subnet        = data.tfe_outputs.core.values.subnet3_id
  subnet = data.terraform_remote_state.core.outputs.subnet3_id
}
