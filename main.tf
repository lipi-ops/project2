provider "aws" {
  region = var.region
}

module "alb" {
 source = "./modules/alb"
}

module "ec2" {
  source                   = "./modules/ec2"
  ami_id                   = var.ami_id
  instance_type            = var.instance_type
  key_name                 = var.key_name
  iam_instance_profile_name =var.iam_instance_profile_name
  iam_role_arn        = var.iam_role_arn 
  bucket_name              = var.bucket_name
  region                   = var.region
  alb_sg_id                = module.alb.alb_sg_id
  subnet_a_id              = "subnet-0fb99a2784c41dd16"
  subnet_b_id              = "subnet-00add720033fb967b"
  target_group_arn         = module.alb.target_group_arn 
}




