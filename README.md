# terraform-aws-infra

Starter Terraform project for AWS with reusable modules:
- vpc
- compute (EC2)
- iam
- storage (S3)
- monitoring (CloudWatch alarm)

Environments:
- envs/dev
- envs/staging
- envs/prod

**Note:** Backend in envs/* is configured for S3 + DynamoDB (placeholder values). Replace bucket/table names and region before use.
