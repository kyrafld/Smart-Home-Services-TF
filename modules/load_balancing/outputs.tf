output "load_balancing" {
  value = aws_lb_target_group.load_balancing_target_group[*].arn
}
