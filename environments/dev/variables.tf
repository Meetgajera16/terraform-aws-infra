variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "aws_profile" {
  type    = string
  default = "meet-dev"
}

variable "s3_bucket_name" {
  description = "Name of the development S3 bucket"
  type        = string
}
