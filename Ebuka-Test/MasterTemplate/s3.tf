resource "aws_s3_bucket" "dev_bucket" {
  bucket = "ebukabucket8"
  acl    = "private"

  tags = {
    Name        = "dev-bucket"
  }
}