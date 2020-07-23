terraform {
  required_version = "= 0.12.20"
  backend "s3" {
    bucket = "c0fee-tfstate-bucket"
    key    = "terraform/.terraform/terraform.tfstate"
    region = "ap-northeast-1"
  }
}

provider "aws" {
  version = "= 2.44.0"
  region  = "ap-northeast-1"
}
