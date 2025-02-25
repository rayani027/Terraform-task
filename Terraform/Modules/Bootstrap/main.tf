resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

resource "azuread_group" "project_admin" {
  display_name     = "${var.env}-project-admin"
  security_enabled = true
  owners           = [var.admin_user_object_id]
}

resource "azuread_group" "ops" {
  display_name     = "${var.env}-ops"
  security_enabled = true
  owners           = [var.ops_user_object_id]
}

resource "azuread_group" "developer" {
  display_name     = "${var.env}-developer"
  security_enabled = true
  owners           = [var.dev_user_object_id]
}

resource "azurerm_role_assignment" "admin_role" {
  scope                = azurerm_resource_group.rg.id
  role_definition_name = "Owner"
  principal_id         = azuread_group.project_admin.object_id
}

resource "azurerm_role_assignment" "ops_role" {
  scope                = azurerm_resource_group.rg.id
  role_definition_name = "Contributor"
  principal_id         = azuread_group.ops.object_id
}

resource "azurerm_role_assignment" "dev_role" {
  scope                = azurerm_resource_group.rg.id
  role_definition_name = "Reader"
  principal_id         = azuread_group.developer.object_id
}
