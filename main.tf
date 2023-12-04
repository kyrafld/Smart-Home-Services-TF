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
