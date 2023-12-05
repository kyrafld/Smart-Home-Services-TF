resource "aws_instance" "services_servers" {
  count         = length(var.service_names)
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  subnet_id     = var.public_subnets[count.index]
  tags = {
    Name = "${var.service_names[count.index]}"
  }

  vpc_security_group_ids      = var.security_group_id
  associate_public_ip_address = true
  key_name                    = "kyraskey"

}


resource "aws_dynamodb_table" "dynamodb-table" {
  count = length(var.database_names)
  name           = var.database_names[count.index]
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "id"


  attribute {
    name = "id"
    type = "S"
  }

  tags = {
    Name = "${var.database_names[count.index]}"
  }
}
//dynamo db - database table - holds information - via terraform 
//iam user role - acesss to dynamo db - via console 
//fill .env.local with new user information 

