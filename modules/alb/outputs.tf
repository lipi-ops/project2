output "alb_sg_id" {
  value       = aws_security_group.alb_sg.id
  description = "Security group ID for the ALB"
}
