/*module "vpc"{
    source = "../../modules/vpc"
    cidr_block="11.0.0.0/16"
    subnet-cidr_block = "11.0.1.0/24"
    subnet-az = "${var.aws-region}a"
    envs = "qa"
}

module "ec2"{
    source = "../../modules/ec2"
    ami-id = "ami-019715e0d74f695be"
    instance_type = "t3.small"
    instance_count = 3
    subnet_id = module.vpc.subnet_id
    envs = "qa"
}

module "s3"{
    source = "../../modules/s3"
    bucket_count = 2
    envs = "qa"
}
*/

