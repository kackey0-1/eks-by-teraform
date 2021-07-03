locals {
  cluster_name = "eks-test-env"
  cluster_version = "1.18"
}

provider "aws" {
  region = "ap-northeast-1"
}

