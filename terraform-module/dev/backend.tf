terraform {
  backend "s3" {
    bucket = "balaji-bucket-statefile1"
    key    = "dev-moduledemo-statefile/terrform.tfstate"
    region = "us-east-1"
  }
}
