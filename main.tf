module "vpc" {
  source          = "./modules/networking"
  private_subnets = var.private_subnets
  public_subnets  = var.public_subnets
  azs             = var.azs
}

module "security" {
  source = "./modules/security"
  vpc_id = module.vpc.vpc_id
}

module "services_servers" {
  source            = "./modules/services-servers"
  instance_type     = var.instance_type
  public_subnets    = module.vpc.public_subnets
  service_names     = var.service_names
  security_group_id = module.security.security_group_id
  key_name          = var.key_name
}

module "databases" {
  source = "./modules/databases"
}

module "load_balancing" {
  source            = "./modules/load_balancing"
  vpc_id            = module.vpc.vpc_id
  instance_id       = module.services_servers.instance_id
  security_group_id = module.security.security_group_id
  public_subnets    = module.vpc.public_subnets
  path              = var.path
  service_names     = var.service_names
}
