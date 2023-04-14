module "vnet" {
  source  = "Azure/vnet/azurerm"
  version = "4.0.0"
  # insert the 3 required variables here
  vnet_location = var.resource_group_location
  resource_group_name = azurerm_resource_group.rg.name
  use_for_each = true
}

resource "azurerm_network_security_group" "nsg1" {
  location            = var.resource_group_location
  name                = "${var.resource_group_name_prefix}-nsg"
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_route_table" "rt1" {
  location            = var.vnet_location
  name                = "test-${random_id.rg_name.hex}-rt"
  resource_group_name = azurerm_resource_group.example.name
}