resource "random_string" "prefix" {
  length  = 6
  special = false
  upper   = false
}

module "bootstrap" {
  source              = "../../modules/bootstrap"
  resource_group_name = "109460-dev-${random_string.prefix.id}"
  location           = var.location
  env                = var.env
}
