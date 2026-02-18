terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~>5.100.0"
    }
  }
  backend "s3" {
    bucket = "terrapipeline-bucket"
    key="environments/dev/terraform.tfstate"
    region="us-east-1"
    dynamodb_table="terra-table"
  }
  
}

provider "aws" {
  region = var.aws-region
}