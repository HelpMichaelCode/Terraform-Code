provider "aws" {
  region     = "us-east-2"
  access_key = "0"
  secret_key = "0"
}

resource "aws_s3_bucket" "my-bucket" {
  bucket = "portarlington9021341"
  acl    = "private"

  tags = {
      Name = "my-buckey-2021"
  }
} 

resource "aws_default_vpc" "default"{}

resource "aws_security_group" "prod_web"{
  name        = "prod_web"
  description = "Allo standard http and https ports inbound and everything outbound"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    "Terraform" : "true"
  }
}