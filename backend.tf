terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.33.0"
    }
  }
  backend "s3" {
    bucket = "tf-training-2026-02"
    key    = "learn-terraform-github-actions/terraform.tfstate"
    region = "eu-west-1"
  }
}

provider "aws" {
 region = "eu-west-1"
}
