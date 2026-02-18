resource "aws_instance" "ec2" {
  ami           = var.ami-id
  instance_type = var.instance_type
  count = var.instance_count
  subnet_id = var.subnet_id

  tags = {
    Name = "${var.envs}-ec2-${count.index}"
  }
}