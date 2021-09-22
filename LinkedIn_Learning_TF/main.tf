provider "aws" {
  region     = "us-east-2"
  access_key = "AKIAWVJQTWKM5WOED35O"
  secret_key = "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"
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

resource "aws_instance" "prod_web" {
  ami           = "ami-04fba448246555019"
  instance_type = "t2.nano"

  vpc_security_group_ids = [
    aws_security_group.prod_web.id
  ]

   tags = {
    "Terraform" : "true"
  }
}

// static ip
resource "aws_eip" "prod_web" {
  instance = aws_instance.prod_web.id

  tags = {
    "Terraform" : "true"
  }
}