terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.61.0"
    }

  }
}

provider "aws" {
  region  = "us-east-1"
  profile = "default"
}

locals {
    env = "Dev"
}

output "my-var"  {
    value = local.env
  
}

module "vpc" {
    source = "github.com/tdh1961/terraform_week_7"
  
}