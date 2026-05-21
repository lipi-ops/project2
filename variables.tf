variable "region" {
  default = "ap-south-1"
}

variable "ami_id" {
  default = "ami-09ed39e30153c3bf9"
}

variable "instance_type" {
  default = "t3.micro"
}

variable "key_name" {
  default = "lipi-key"
}

variable "iam_role_arn" {
  default = "arn:aws:iam::948735414300:role/ec2ssmconnect"
}

variable "bucket_name" {
  default = "terrafrm-lipi-test1"
}
variable "iam_instance_profile_name" {
  default="ec2ssmconnect"
  type        = string
  description = "Name of IAM instance profile"
}

