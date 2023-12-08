resource "aws_launch_template" "home_services" {
  count                  = length(var.ami_img)
  name_prefix            = "home-services"
  image_id               = var.ami_img[count.index]
  instance_type          = var.instance_type
  vpc_security_group_ids = var.security_group_id

  network_interfaces {
    associate_public_ip_address = true
  }

  tags = {
    Name = "${var.service_names[count.index]}"
  }
}

resource "aws_autoscaling_group" "home_services" {
  count               = length(var.ami_img)
  name                = var.service_names[count.index]
  desired_capacity    = 1
  max_size            = 1
  min_size            = 1
  vpc_zone_identifier = var.public_subnets

  launch_template {
    id      = aws_launch_template.home_services[count.index].id
    version = "$Latest"
  }

}

resource "aws_autoscaling_attachment" "home_services" {
  count                  = length(var.ami_img)
  autoscaling_group_name = aws_autoscaling_group.home_services[count.index].name
  lb_target_group_arn    = var.load_balancing[count.index]

}
