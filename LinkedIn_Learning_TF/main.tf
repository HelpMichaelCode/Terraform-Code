provider "aws" {
  region     = "us-east-2"
  access_key = "AKIAWVJQTWKMVDH33VEW"
  secret_key = "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"
}

resource "aws_s3_bucket" "my-bucket" {
  bucket = "portarlington9021341"
  acl    = "private"

  tags = {
      Name = "my-buckey-2021"
  }
} 