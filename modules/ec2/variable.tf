variable "ami-id" {
  type        = string
  description = "AMI _ID of the EC2"
}
variable "instance_type" {
  type        = string
  description = "Instance type of the EC2"
}
variable "instance_count" {
  type        = number
  description = "Total EC2 machine to be created"
}
variable "subnet_id" {
  type        = string
  description = "AMI _ID of the EC2"
}
variable "envs" {
  type        = string
  description = "Which environment to be created:'dev,qa,production'"
}
