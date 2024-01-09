output "smart_home_tg_arns" {
  value = aws_lb_target_group.smart_home[*].arn
}