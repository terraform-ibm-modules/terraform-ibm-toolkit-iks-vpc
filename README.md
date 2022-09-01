# IBM Cloud Kubernetes VPC cluster

Provisions an IBM Cloud Kubernetes VPC cluster using a provided VPC instance.

## Software dependencies

The module depends on the following software components:

### Command-line tools

- terraform - v13
- kubectl

### Terraform providers

- IBM Cloud provider >= 1.18
- Helm provider >= 1.1.1 (provided by Terraform)

## Module dependencies

This module makes use of the output from other modules:

- VPC - github.com/cloud-native-toolkit/terraform-ibm-vpc.git
- Subnet - github.com/cloud-native-toolkit/terraform-ibm-vpc.git

## Example usage

[Refer test cases for more details](test/stages/stage2-cluster.tf)

```hcl-terraform
module "cluster" {
  source = "github.com/cloud-native-toolkit/terraform-ibm-iks-vpc.git"

  resource_group_name = var.resource_group_name
  region              = var.region
  ibmcloud_api_key    = var.ibmcloud_api_key
  name                = var.cluster_name
  worker_count        = var.worker_count
  exists              = var.cluster_exists
  name_prefix         = var.name_prefix
  vpc_name            = module.vpc.name
  vpc_subnet_count    = module.subnet.subnet_count
  vpc_subnets         = module.subnet.subnets
}
```
