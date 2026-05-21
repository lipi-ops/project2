variable "ami_id" {
  type        = string
  description = "AMI ID for EC2 instance"
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

variable "alb_sg_id" {
  type        = string
  description = "Security group ID for ALB"
}

variable "subnet_a_id" {
  type        = string
  description = "Subnet ID for AZ A"
}

variable "subnet_b_id" {
  type        = string
  description = "Subnet ID for AZ B"
}
variable "iam_instance_profile_name" {
  type        = string
  description = "Name of the IAM instance profile to attach to EC2 instances"
}

variable "target_group_arn" {
  type        = string
  description = "ARN of the target group to register EC2s"
}