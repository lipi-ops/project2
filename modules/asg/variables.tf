variable "ami_id" {
  type        = string
  description = "AMI ID for the ASG instances"
}

variable "instance_type" {
  type        = string
  description = "EC2 instance type"
}

variable "key_name" {
  type        = string
  description = "Key pair name"
}

variable "iam_role_arn" {
  type        = string
  description = "IAM role ARN"
}

variable "bucket_name" {
  type        = string
  description = "S3 bucket name"
}

variable "region" {
  type        = string
  description = "AWS region"
}

variable "subnet_a_id" {
  default = "subnet-0fb99a2784c41dd16"
  type        = string
  description = "Subnet ID for AZ A"
}

variable "subnet_b_id" { 
  default = "subnet-00add720033fb967b"
  type        = string
  description = "Subnet ID for AZ B"
}

variable "target_group_arn" {
  type        = string
  description = "Target group ARN for ALB"
}
