
resource "aws_instance" "ec2_a" {
  ami                  = var.ami_id
  instance_type        = var.instance_type
  key_name             = var.key_name
  subnet_id            = var.subnet_a_id
  vpc_security_group_ids = [var.alb_sg_id]

  iam_instance_profile = "ec2ssmconnect"
//  iam_role_arn="arn:aws:iam::948735414300:role/ec2ssmconnect"
  tags = {
    Name = "ec2-a"
  }
  user_data = base64encode (<<-EOF
    #!/bin/bash
    sudo dnf update -y
    sudo dnf install -y httpd
    sudo systemctl start httpd
    sudo systemctl enable httpd
    echo "<h1>Hello from EC2 User Data!</h1>" > /var/www/html/index.html
    aws s3 cp /var/www/html/index.html s3://${var.bucket_name}/index.html --region ${var.region}
  EOF
  )
}

resource "aws_instance" "ec2_b" {
  ami                  = var.ami_id
  instance_type        = var.instance_type
  key_name             = var.key_name
  subnet_id            = var.subnet_b_id
  vpc_security_group_ids = [var.alb_sg_id]
iam_instance_profile = "ec2ssmconnect"
// iam_role_arn="arn:aws:iam::948735414300:role/ec2ssmconnect"
  tags = {
    Name = "ec2-b"
  }
  user_data = base64encode (<<-EOF
    #!/bin/bash
    sudo dnf update -y
    sudo dnf install -y httpd
    sudo systemctl start httpd
    sudo systemctl enable httpd
    echo "<h1>Hello from EC2 User Data!</h1>" > /var/www/html/index.html
    aws s3 cp /var/www/html/index.html s3://${var.bucket_name}/index.html --region ${var.region}
  EOF
  )
}

resource "aws_lb_target_group_attachment" "ec2_a" {
  target_group_arn = var.target_group_arn
  target_id        = aws_instance.ec2_a.id
  port             = 80
}

resource "aws_lb_target_group_attachment" "ec2_b" {
  target_group_arn = var.target_group_arn
  target_id        = aws_instance.ec2_b.id
  port             = 80
}