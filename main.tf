# main.tf

module "vpc" {
  source = "./modules/vpc"

  region               = "us-east-1"
  vpc_cidr             = "10.0.0.0/16"
  vpc_name             = "my-vpc"
  public_subnet_cidrs  = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnet_cidrs = ["10.0.3.0/24", "10.0.4.0/24"]
  availability_zones   = ["us-east-1a", "us-east-1b"]

  tags = {
    Environment = "Production"
    Terraform   = "true"
  }
}

output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnet_ids" {
  value = module.vpc.public_subnet_ids
}

output "private_subnet_ids" {
  value = module.vpc.private_subnet_ids
}

# main.tf


module "s3_bucket" {
  source             = "./modules/s3"
  bucket_name        = "strangodalo2302kelomo"
  region             = "us-east-1"
  acl                = "private"
  versioning_enabled = "Disabled"
  sse_algorithm      = "AES256"
  tags = {
    Environment = "Production"
    Terraform   = "true"
  }

}
# provider "aws" {
#   region = "us-east-1" # 
# }



output "bucket_id" {
  value = module.s3_bucket.bucket_id
}

output "bucket_arn" {
  value = module.s3_bucket.bucket_arn
}