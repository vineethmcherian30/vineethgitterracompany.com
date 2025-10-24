resource "aws_s3_bucket" "this" {
  bucket = var.bucket_name
  force_destroy = false
  tags = { Name = "${var.project}-bucket" }
}

output "bucket_arn" { value = aws_s3_bucket.this.arn }
