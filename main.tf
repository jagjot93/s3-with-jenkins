provider "aws" {
  version = "3.18.0"
  region = "us-east-1"
  assume_role {
    role_arn = "arn:aws:iam::536530634742:role/admin-access"
  }
}
