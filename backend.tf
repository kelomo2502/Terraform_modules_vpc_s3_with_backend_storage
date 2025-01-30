terraform {
  backend "s3" {
    bucket = "strangodalo2302kelomo"
    key    = "backend.tf"
    region = "us-east-1"
  }
}
