# Create an VPC
resource "aws_vpc" "myvpc" {
  cidr_block       = var.cidr_block
  instance_tenancy = "default"

  tags = {
    Name = "${var.envs}-vpc"
  }
}
# Create an Subnet inside the VPC
resource "aws_subnet" "mysubnet" {
  vpc_id     = aws_vpc.myvpc.id
  cidr_block = var.subnet-cidr_block
  availability_zone = var.subnet-az
  tags = {
    Name = "${var.envs}-subnet"
  }
}

output "subnet_id" {
  value       = aws_subnet.mysubnet.id

}
