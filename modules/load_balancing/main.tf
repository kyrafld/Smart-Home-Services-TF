resource "aws_lb_target_group" "smart_home" {
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

resource "aws_lb_target_group_attachment" "smart_home" {
  target_group_arn = aws_lb_target_group.smart_home[count.index].arn
  count            = length(var.instance_id)
  target_id        = var.instance_id[count.index]
  port             = 3000
}

resource "aws_lb" "smart_home" {
  name               = "lb-smart-home"
  internal           = false
  load_balancer_type = "application"
  security_groups    = var.security_group_id
  subnets            = var.public_subnets
}

resource "aws_lb_listener" "smart_home" {
  load_balancer_arn = aws_lb.smart_home.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.smart_home[0].arn
  }
}

resource "aws_lb_listener_rule" "smart_home" {
  count        = length(var.path)
  listener_arn = aws_lb_listener.smart_home.arn

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.smart_home[count.index].arn
  }

  condition {
    path_pattern {
      values = ["/api/${var.path[count.index]}*"]
    }
  }

}
