provider "aws" {
  region = "eu-west-2"
  assume_role {
     role_arn = var.role_arn
  }
}