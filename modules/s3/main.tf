resource "aws_s3_bucket" "s3" {
  count = var.bucket_count
  bucket = "${var.envs}-awsbucket-${count.index}"

  tags = {
    Bucket_Name = "${var.envs}-awsbucket-${count.index}"
    Environment = var.envs
  }
}