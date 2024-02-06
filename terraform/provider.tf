terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.31.0" # AWS provider version, not terraform version
    }
  }

backend "s3" {
    bucket =  "dawsdevops-dev"
    key = "catalogue2"
    region = "us-east-1"
    dynamodb_table = "ddevops-devtable"

}
}
  provider "aws" {
  region = "us-east-1"
}