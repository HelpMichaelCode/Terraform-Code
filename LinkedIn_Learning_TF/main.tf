# Configure the AWS Provider
provider "aws" {
  region = "us-east-2"
  access_key = "AKIAWVJQTWKMVDH33VEW"
  secret_key = "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"
}

resource "aws_s3_bucket" "tf-s3-bukcet"{
    bucket = var.tf-s3-bukcet-name
    acl = "private"
}