data "aws_caller_identity" "current" {}

output "aws_account" {
  value = data.aws_caller_identity.current.account_id
}

module "data_bucket" {
  source = "../../modules/s3-bucket"

  bucket_name = var.s3_bucket_name

  tags = {
    Environment = "dev"
    Project     = "data-science"
    ManagedBy   = "terraform"
  }
}

output "data_bucket_name" {
  value = module.data_bucket.bucket_name
}
