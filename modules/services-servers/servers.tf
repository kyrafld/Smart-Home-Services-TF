resource "aws_instance" "services_servers" {
  count         = length(var.ami_img)
  ami           = var.ami_img[count.index]
  instance_type = var.instance_type
  subnet_id     = var.public_subnets[count.index]
  tags = {
    Name = "${var.service_names[count.index]}"
  }

  vpc_security_group_ids      = var.security_group_id
  associate_public_ip_address = true
  key_name                    = var.key_name

}

