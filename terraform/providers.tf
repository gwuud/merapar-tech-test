terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  required_version = "~> 1.5"
}

provider "aws" {
  region  = "eu-west-2"
  profile = "default"

  default_tags {
    tags = {
      Org       = "Merapar"
      Component = "Tech Test"
    }
  }
}
