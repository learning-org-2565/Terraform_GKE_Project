#locals here we add variables to resure for the main tf code configuration
locals {
  owners = var.business_divsion
  env = var.environment
  # name = "${{locals.owners}}-${{locals.env}}-private-cluster"
  name = "${var.business_divsion}-${var.environment}"
  common_tags = {
    owners = local.owners
    env = local.env
  }
}