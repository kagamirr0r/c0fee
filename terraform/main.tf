provider "aws" {
  region  = "ap-northeast-1"
  version = "~> 2.8"
}

terraform {
  backend "s3" {
    bucket = "c0fee-tfstate"
    key    = "terraform/.terraform/terraform.tfstate"
    region = "ap-northeast-1"
  }
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

# resource "aws_s3_bucket" "cloudwatch_logs" {
#   bucket = "cloudwatch-logs-C0FEE"

#   versioning {
#     enabled = true
#   }

#   lifecycle_rule {
#     enabled = true

#     expiration {
#       days = "180"
#     }
#   }
# }

# data "aws_iam_policy_document" "kinesis_data_firehose" {
#   statement {
#     effect = "Allow"

#     actions = [
#       "s3:AbortMultipartUpload",
#       "s3:GetBucketLocation",
#       "s3:GetObject",
#       "s3:ListBucket",
#       "s3:ListBucketMultipartUploads",
#       "s3:PutObject",
#     ]

#     resources = [
#       "arn:aws:s3:::${aws_s3_bucket.cloudwatch-logs.id}",
#       "arn:aws:s3:::${aws_s3_bucket.cloudwatch_logs.id}/*",
#     ]
#   }
# }

# module "kinesis_data_firehose_role" {
#   source     = "./iam_role"
#   name       = "kinesis-data-firehose"
#   identifier = "firehose.amazonaws.com"
#   policy     = data.aws_iam_policy_document.kinesis_data_firehose.json
# }

# resource "aws_kinesis_firehose_delivery_stream" "c0fee" {
#   name        = "c0fee"
#   destination = "s3"

#   s3_configuration {
#     role_arn   = module.kinesis_data_firehose_role.iam_role_arn
#     bucket_arn = aws_s3_bucket.cloudwatch_logs.arn
#   }
# }
