module "networking" {
  source          = "./modules/networking"
  private_subnets = var.private_subnets
  public_subnets  = var.public_subnets
  azs             = var.azs
}

module "security" {
  source = "./modules/security"
  vpc_id = module.networking.vpc_id
}

module "services_servers" {
  source            = "./modules/services-servers"
  instance_type     = var.instance_type
  public_subnets    = module.networking.public_subnets
  service_names     = var.service_names
  security_group_id = module.security.security_group_id
  key_name          = var.key_name
  ami_img           = var.ami_img
}

module "databases" {
  source = "./modules/databases"
}

module "load_balancing" {
  source            = "./modules/load_balancing"
  vpc_id            = module.networking.vpc_id
  instance_id       = module.services_servers.instance_id
  security_group_id = module.security.security_group_id
  public_subnets    = module.networking.public_subnets
  path              = var.path
  service_names     = var.service_names

}

module "autoscaling" {
  source             = "./modules/autoscaling"
  ami_img            = var.ami_img
  instance_type      = var.instance_type
  key_name           = var.key_name
  security_group_id  = module.security.security_group_id
  public_subnets_ids = module.networking.public_subnets
  service_names      = var.service_names
  max_size           = var.max_size
  min_size           = var.min_size
  desired_capacity   = var.desired_capacity
  smart_home_tg_arns = module.load_balancing.smart_home_tg_arns
}
