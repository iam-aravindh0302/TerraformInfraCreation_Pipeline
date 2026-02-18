module "vpc"{
    source = "../../modules/vpc"
    cidr_block="12.0.0.0/16"
    subnet-cidr_block = "12.0.1.0/24"
    subnet-az = "${var.aws-region}a"
    envs = "production"
}

module "ec2"{
    source = "../../modules/ec2"
    ami-id = "ami-0b6c6ebed2801a5cb"
    instance_type = "t3.small"
    instance_count = 4
    subnet_id = module.vpc.subnet_id
    envs = "production"
}

module "s3"{
    source = "../../modules/s3"
    bucket_count = 3
    envs = "production"
}

