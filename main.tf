provider "aws" {
  region = "us-east-2"
}
<<<<<<< HEAD

# S3 Bucket
resource "aws_s3_bucket" "website_bucket" {
  bucket = "mydan-amazon-aws-bucket"

=======
 
# S3 Bucket
resource "aws_s3_bucket" "website_bucket" {
  bucket = "2472582-danish-12"
 
>>>>>>> 644e4d1 (initial commit)
  tags = {
    Name = "static-website"
  }
}
<<<<<<< HEAD

# S3 Website Configuration (NOT deprecated)
resource "aws_s3_bucket_website_configuration" "website" {
  bucket = aws_s3_bucket.website_bucket.id

=======
 
# S3 Website Configuration (NOT deprecated)
resource "aws_s3_bucket_website_configuration" "website" {
  bucket = aws_s3_bucket.website_bucket.id
 
>>>>>>> 644e4d1 (initial commit)
  index_document {
    suffix = "index.html"
  }
}
<<<<<<< HEAD

# Public Access Block (ALLOW public policy)
resource "aws_s3_bucket_public_access_block" "public_access" {
  bucket = aws_s3_bucket.website_bucket.id

  block_public_acls       = true
  ignore_public_acls      = true
  block_public_policy     = false   # ✅ IMPORTANT
  restrict_public_buckets = false   # ✅ IMPORTANT
}

# Public Read Bucket Policy
resource "aws_s3_bucket_policy" "bucket_policy" {
  bucket = aws_s3_bucket.website_bucket.id

=======
 
# Public Access Block (ALLOW public policy)
resource "aws_s3_bucket_public_access_block" "public_access" {
  bucket = aws_s3_bucket.website_bucket.id
 
  block_public_acls       = false
  ignore_public_acls      = false
  block_public_policy     = false   # ✅ IMPORTANT
  restrict_public_buckets = false   # ✅ IMPORTANT
}
 
# Public Read Bucket Policy
resource "aws_s3_bucket_policy" "bucket_policy" {
  bucket = aws_s3_bucket.website_bucket.id
 
>>>>>>> 644e4d1 (initial commit)
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "PublicReadGetObject"
        Effect    = "Allow"
        Principal = "*"
        Action    = "s3:GetObject"
        Resource  = "${aws_s3_bucket.website_bucket.arn}/*"
      }
    ]
  })
}
