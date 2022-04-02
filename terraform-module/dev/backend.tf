terraform {
  backend "s3" {
    bucket = "pradeep-bucket-statefile1"
    key    = "dev-moduledemo-statefile/terrform.tfstate"
    region = "us-east-1"
  }
}
