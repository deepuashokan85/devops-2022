terraform {
  backend "s3" {
    bucket = "balaji-bucket-statefile1"
    key    = "demo-statefile/terrform.tfstate"
    region = "us-east-1"
  }
}
