locals {
  cluster_name    = "eks-example"
  cluster_version = "1.18"
  default_tag     = {
    "createdBy"   = "kakimoto",
    "environment" = "dev"
  }
}

provider "aws" {
  region = "${var.AWS_REGION}"
  access_key = "${var.AWS_ACCESS_KEY_ID}"
  secret_key = "${var.AWS_SECRET_ACCESS_KEY}"
}
