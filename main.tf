terraform {
  required_version = "~> 1.5.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  # Adding Backend as S3 for Remote State Storage
  backend "s3" {
    bucket = "tf-capgemini-state"
    key    = "dev/project1/terraform.tfstate"
    region = "us-east-1"

    # For State Locking
    dynamodb_table = "stateLock"
    encrypt        = true
  }
}

provider "aws" {
  region = "us-east-1"
}


/*
Note-1:  AWS Credentials Profile (profile = "default") configured on your local desktop terminal  
$HOME/.aws/credentials
*/

# Adding Backend as S3 for Remote State Storage
