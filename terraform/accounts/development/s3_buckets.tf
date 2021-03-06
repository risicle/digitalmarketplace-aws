resource "aws_s3_bucket" "dev_uploads_s3_bucket" {
  bucket = "digitalmarketplace-dev-uploads"
  acl    = "private"
  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Principal": {"AWS": "arn:aws:iam::${var.aws_main_account_id}:root"},
      "Action": [
        "s3:ListBucket",
        "s3:GetBucketLocation"
      ],
      "Effect": "Allow",
      "Resource": "arn:aws:s3:::digitalmarketplace-dev-uploads"
    },
    {
      "Principal": {"AWS": "arn:aws:iam::${var.aws_main_account_id}:root"},
      "Action": [
        "s3:DeleteObject",
        "s3:GetObject",
        "s3:PutObject",
        "s3:GetObjectAcl",
        "s3:PutObjectAcl"
      ],
      "Effect": "Allow",
      "Resource": "arn:aws:s3:::digitalmarketplace-dev-uploads/*"
    }
  ]
}
POLICY
}
