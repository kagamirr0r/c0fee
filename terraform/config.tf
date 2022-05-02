terraform {
  # required_version = "= 0.12.20"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  # backend "s3" {
  #   bucket = "c0fee-tfstate"
  #   key    = "terraform/.terraform/terraform.tfstate"
  #   region = "ap-northeast-1"
  # }
}

provider "aws" {
  # version = "= 2.44.0"
  region  = "ap-northeast-1"
# shared_config_files      = ["/Users/ryohei-kagami/.aws/config"]
  # shared_credentials_files = ["/Users/ryohei-kagami/.aws/credentials"]
  profile = "c0fee_owner"
}
