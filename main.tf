provider "aws" {
  # version = "3.18.0"
  region = "us-east-1"
  assume_role {
    role_arn = "arn:aws:iam::053969469615:role/tf-admin-access"
  }
}
