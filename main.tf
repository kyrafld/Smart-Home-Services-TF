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
  security_group_id = module.security.security_group_id
}

module "databases" {
  source = "./modules/databases"

}
