terraform {
  backend "s3" {
    bucket         = "REPLACE_WITH_YOUR_STATE_BUCKET"
    key            = "dev/terraform.tfstate"
    region         = "ap-southeast-2"
    dynamodb_table = "REPLACE_WITH_YOUR_LOCK_TABLE"
    encrypt        = true
  }
}
