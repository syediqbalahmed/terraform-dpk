terraform {
  required_version = ">= 1.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.29.0"
    }
  }

#############################################################
#Terraform State Storage EU region bucket
#############################################################
  backend "s3" {
    bucket         = "Enter Name of Bucket"
    key            = "bucket-name/folder-name/terraform.tfstate"
    region         = "eu-west-2"
    encrypt        = true
    kms_key_id     = "Create KMS Key and enter id here"
    dynamodb_table = "Create DynamoDB table and enter name here"
  }
}

###################################
# Local variables
###################################

locals {
  name                 = "dev"
  region-primary       = "eu-west-2"
  region-primary-alias = "eu"
  tags = {
    Environment = "development"
    Name        = "quagga-dev"
  }
}

###################################
# Setting AWS Account id 
###################################
data "aws_caller_identity" "current" {}


module "metadata_validator" {
  source                       = "../../../modules/aws_connect"
  instance_name                = "Enter Name of instance"
  instance_description         = "Description"
  quick_connect_name           = "Enter Quick Connect Name"
  quick_connect_description    = "Description"
  routing_profile_name         = "Enter Routing Profile Name"
  routing_profile_description  = "Description"
  contact_flow_id              = "YOUR_CONTACT_FLOW_ID_HERE" # Replace with your actual contact flow ID
  queue_id                     = "YOUR_QUEUE_ID_HERE" # Replace with your actual queue ID
  username                     = "Enter Username"
  phone_type                   = "SOFT_PHONE"
  security_profile_ids         = [
    "YOUR_SECURITY_PROFILE_ID_HERE", # Replace with your actual security profile ID
  ]
}