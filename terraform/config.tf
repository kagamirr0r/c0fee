terraform {
  # required_version = "= 0.12.20"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  backend "s3" {
    bucket = "c0fee-tfstate"
    key    = "terraform/.terraform/terraform.tfstate"
    region = "ap-northeast-1"

    profile = "c0fee_owner"
  }
}

provider "aws" {
  region  = "ap-northeast-1"
  profile = "c0fee_owner"
}
