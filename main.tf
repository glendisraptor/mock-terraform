# if workspace is default then set variable to prod else set to worksapce name

locals {
  ENV = terraform.workspace == "default" ? "prod" : terraform.workspace
}

terraform {
  required_providers {
    aws = {
      # version = "~> 3.0"
      source = "hashicorp/aws"
    }
  }
}

provider "aws" {
  # region = "af-south-1"
}

resource "aws_s3_bucket" "my_bucket" {
  bucket = "random-bucket-325647874rdesc-${local.ENV}"
}
