# AWS Terraform Infrastructure

Reusable Terraform infrastructure for AWS development environments.

## Project Structure

```text
terraform-aws-infra/
├── environments/
│   └── dev/
│       ├── main.tf
│       ├── providers.tf
│       ├── variables.tf
│       ├── versions.tf
│       ├── terraform.tfvars.example
│       └── .terraform.lock.hcl
├── modules/
│   └── s3-bucket/
│       ├── main.tf
│       ├── variables.tf
│       └── outputs.tf
├── .gitignore
└── README.md
```

## Overview

This repository contains reusable Terraform modules and environment-specific configurations for AWS infrastructure.

The current setup includes a reusable S3 bucket module and a development environment.

## S3 Bucket Module

The S3 module includes:

- S3 bucket creation
- Public access blocking
- Bucket versioning
- Server-side encryption using AES256
- Resource tagging
- Reusable outputs for bucket name and ARN

## Prerequisites

Before using this repository, install:

- Terraform
- AWS CLI
- Git

You must also authenticate with AWS before running Terraform.

Example:

```bash
aws login --profile meet-dev
```

## Usage

Move to the development environment:

```bash
cd environments/dev
```

Create your local variables file:

```bash
cp terraform.tfvars.example terraform.tfvars
```

Edit `terraform.tfvars` and provide a globally unique S3 bucket name.

Initialize Terraform:

```bash
terraform init
```

Format the configuration:

```bash
terraform fmt -recursive
```

Validate the configuration:

```bash
terraform validate
```

Preview infrastructure changes:

```bash
terraform plan
```

Only after reviewing the plan should infrastructure be created:

```bash
terraform apply
```

## Security

Sensitive and local Terraform files are excluded from Git.

Do not commit:

- `terraform.tfvars`
- Terraform state files
- AWS credentials
- Access keys
- Session tokens
- Passwords
- Secrets

The `.terraform.lock.hcl` file is committed to keep provider versions reproducible.

## Current Status

The Terraform configuration has been initialized, formatted, validated, and successfully planned.

The development S3 infrastructure is intentionally not deployed yet to avoid creating unnecessary AWS resources or charges.

## Future Improvements

Planned additions may include:

- VPC module
- IAM module
- ECR module
- ECS or EKS infrastructure
- Remote Terraform state
- GitHub Actions Terraform CI
- Separate staging and production environments
