module "vpc" {
  source          = "./networking"
  private_subnets = var.private_subnets
  public_subnets  = var.public_subnets
  azs             = var.azs

}