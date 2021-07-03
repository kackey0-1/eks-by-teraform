locals {
  cluster_name = "eks-test-env"
  cluster_version = "1.18"
  createdBy = "terraform"
  createdFor = "eks-test-env"
}

provider "aws" {
  region = "ap-northeast-1"
}

