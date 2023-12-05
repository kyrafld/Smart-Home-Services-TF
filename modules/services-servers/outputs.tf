output "services_servers" {
  value = aws_instance.services_servers
}

output "instance_id" {
  value = aws_instance.services_servers[*].id
}


