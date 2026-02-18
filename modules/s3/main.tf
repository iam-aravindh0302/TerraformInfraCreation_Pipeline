resource "aws_s3_bucket" "s3" {
  count = var.bucket_count
  bucket = "${var.envs}-bucket-${count.index}"

  tags = {
    Bucket_Name = "${var.envs}-bucket-${count.index}"
    Environment = var.envs
  }
}