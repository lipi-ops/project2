resource "aws_launch_template" "web" {
  name_prefix   = "web-"
  image_id      = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name

  iam_instance_profile {
    arn = "arn:aws:iam::948735414300:instance-profile/ec2ssmconnect"
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

resource "aws_autoscaling_group" "asg" {
  name             = "web-asg"
  min_size         = 2
  desired_capacity = 2
  max_size         = 2

  vpc_zone_identifier = [var.subnet_a_id, var.subnet_b_id]

  launch_template {
    id      = aws_launch_template.web.id
    version = "$Latest"
  }

  target_group_arns = [var.target_group_arn]
}

output "asg_name" {
  value = aws_autoscaling_group.asg.name
}
