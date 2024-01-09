data "aws_ami" "smart_home" {
  count       = length(var.ami_img)
  owners      = ["self"]
  most_recent = true

  filter {
    name   = "image-id"
    values = [var.ami_img[count.index]]
  }
}

resource "aws_launch_template" "smart_home" {
  count         = length(var.ami_img)
  name          = "launch-template-${var.service_names[count.index]}"
  image_id      = data.aws_ami.smart_home[count.index].id
  instance_type = var.instance_type
  key_name      = var.key_name

  network_interfaces {
    subnet_id                   = var.public_subnets_ids[count.index]
    associate_public_ip_address = true
    security_groups             = var.security_group_id
  }

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "launch-template-${var.service_names[count.index]}"
    }
  }
}

resource "aws_autoscaling_group" "smart-home" {
  count               = length(var.service_names)
  name                = "load-balancer-${var.service_names[count.index]}-autoscaling_group"
  min_size            = var.min_size
  max_size            = var.max_size
  desired_capacity    = var.desired_capacity
  vpc_zone_identifier = var.public_subnets_ids

  launch_template {
    id      = aws_launch_template.smart_home[count.index].id
    version = "$Latest"
  }

  tag {
    key                 = "Name"
    value               = "${var.service_names[count.index]}-instance-autoscaling-group"
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_attachment" "smart_home" {
  count                  = length(var.smart_home_tg_arns)
  autoscaling_group_name = aws_autoscaling_group.smart-home[count.index].id
  lb_target_group_arn    = var.smart_home_tg_arns[count.index]

}
