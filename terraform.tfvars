public_subnets  = ["10.0.1.0/24", "10.0.3.0/24", "10.0.5.0/24"]
private_subnets = ["10.0.2.0/24", "10.0.4.0/24", "10.0.6.0/24"]
azs             = ["eu-west-2a", "eu-west-2b", "eu-west-2c"]
ami_img         = ["ami-075309d792f0a9757", "ami-0a5c3c78fbc5af895", "ami-008c133f425ff792c"]
instance_type   = "t3.micro"
service_names   = ["lighting", "heating", "status"]
key_name        = "kyraskey"
path            = ["lights", "heating", "status"]
desired_capacity = "2"
min_size = "1"
max_size = "2"


