output "security_group_id" {
value = [aws_security_group.allow_egress.id, aws_security_group.allow_http.id, aws_security_group.allow_https.id, aws_security_group.allow_ssh.id]
}