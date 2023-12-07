resource "aws_lb_target_group" "load_balancing_target_group" {
  count            = length(var.path)
  name             = var.service_names[count.index]
  port             = 3000
  protocol         = "HTTP"
  protocol_version = "HTTP1"
  vpc_id           = var.vpc_id

  health_check {
    port     = 3000
    protocol = "HTTP"
    path     = "/api/${var.path[count.index]}"
  }

  tags = {
    Name = "${var.service_names[count.index]}"
  }
}

resource "aws_lb_target_group_attachment" "load_balancing_target_attachement" {
  target_group_arn = aws_lb_target_group.load_balancing_target_group[count.index].arn
  count            = length(var.instance_id)
  target_id        = var.instance_id[count.index]
  port             = 3000
}

resource "aws_lb" "load_balancer" {
  name               = "lb-smart-home"
  internal           = false
  load_balancer_type = "application"
  security_groups    = var.security_group_id
  subnets            = var.public_subnets

  enable_deletion_protection = true

  tags = {
    Environment = "production"
  }
}

resource "aws_lb_listener" "lb_listener" {
  load_balancer_arn = aws_lb.load_balancer.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.load_balancing_target_group[0].arn
  }
}

resource "aws_lb_listener_rule" "lb_listener_rules" {
  count        = length(var.path)
  listener_arn = aws_lb_listener.lb_listener.arn

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.load_balancing_target_group[count.index].arn
  }

  condition {
    path_pattern {
      values = ["/api/${var.path[count.index]}*"]
    }
  }

}
