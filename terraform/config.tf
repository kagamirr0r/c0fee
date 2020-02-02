terraform {
  required_version = "= 0.12.20"
  backend "s3" {
    bucket = "c0fee-tfstate"
    key    = "terraform/.terraform/terraform.tfstate"
    region = "ap-northeast-1"
  }
}

provider "aws" {
  version = "= 2.44.0"
}

resource "aws_s3_bucket" "tfstate" {
  bucket = "c0fee-tfstate"

  versioning {
    enabled = true
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}
