terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = ">= 6.20.0, < 7.0.0"
    }
  }

  backend "s3" {
    bucket = "roboshop1-84s"
    key    = "roboshop-dev-eks"
    region = "us-east-1"
    encrypt        = true
    use_lockfile = false
  }
}

provider "aws" {
  # Configuration options
  region = "us-east-1"
}