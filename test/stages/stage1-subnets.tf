module "subnets" {
  source = "github.com/cloud-native-toolkit/terraform-ibm-vpc-subnets.git"

  resource_group_name = var.resource_group_name
  region            = var.region
  vpc_name          = module.vpc.name
  gateways          = module.gateways.gateways
  _count            = 2
  label             = "bastion"
}
