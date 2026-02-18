resource "aws_s3_bucket" "s3" {
  count = var.bucket_count
  bucket = "${var.envs}-bucket-${count.index}"
  region="us-east-1"
  

  tags = {
    Bucket_Name = "${var.envs}-bucket-${count.index}"
    Environment = var.envs
  }
}