resource "azurerm_resource_group" "myresourcegroup" {
  name     = "${var.prefix}-workshop"
  location = var.location

  tags = {
    environment = var.environment
  }
}

resource "azurerm_virtual_network" "vnet" {
  name                = "${var.prefix}-vnet"
  location            = azurerm_resource_group.myresourcegroup.location
  address_space       = [var.address_space]
  resource_group_name = azurerm_resource_group.myresourcegroup.name

  tags = {
    environment = var.environment
  }
}

output "rg_name" {
  value = azurerm_resource_group.myresourcegroup.name
}

output "vnet_name" {
  value = azurerm_virtual_network.vnet.name
}

# resource "azurerm_subnet" "subnet" {
#   name                 = "${var.prefix}-subnet"
#   virtual_network_name = azurerm_virtual_network.vnet.name
#   resource_group_name  = azurerm_resource_group.myresourcegroup.name
#   address_prefixes     = [var.subnet_prefix]

#   tags = {
#     environment = var.environment
#   }
# }

# resource "azurerm_network_security_group" "catapp-sg" {
#   name                = "${var.prefix}-sg"
#   location            = var.location
#   resource_group_name = azurerm_resource_group.myresourcegroup.name

#   security_rule {
#     name                       = "HTTP"
#     priority                   = 100
#     direction                  = "Inbound"
#     access                     = "Allow"
#     protocol                   = "Tcp"
#     source_port_range          = "*"
#     destination_port_range     = "80"
#     source_address_prefix      = "*"
#     destination_address_prefix = "*"
#   }

#   security_rule {
#     name                       = "HTTPS"
#     priority                   = 102
#     direction                  = "Inbound"
#     access                     = "Allow"
#     protocol                   = "Tcp"
#     source_port_range          = "*"
#     destination_port_range     = "443"
#     source_address_prefix      = "*"
#     destination_address_prefix = "*"
#   }

#   security_rule {
#     name                       = "SSH"
#     priority                   = 101
#     direction                  = "Inbound"
#     access                     = "Allow"
#     protocol                   = "Tcp"
#     source_port_range          = "*"
#     destination_port_range     = "22"
#     source_address_prefix      = "*"
#     destination_address_prefix = "*"
#   }
# }

# resource "azurerm_network_interface" "catapp-nic" {
#   name                = "${var.prefix}-catapp-nic"
#   location            = azurerm_resource_group.myresourcegroup.location
#   resource_group_name = azurerm_resource_group.myresourcegroup.name

#   ip_configuration {
#     name                          = "${var.prefix}ipconfig"
#     subnet_id                     = azurerm_subnet.subnet.id
#     private_ip_address_allocation = "Dynamic"
#     public_ip_address_id          = azurerm_public_ip.catapp-pip.id
#   }
# }

# resource "azurerm_network_interface_security_group_association" "catapp-nic-sg-ass" {
#   network_interface_id      = azurerm_network_interface.catapp-nic.id
#   network_security_group_id = azurerm_network_security_group.catapp-sg.id
# }

# resource "azurerm_public_ip" "catapp-pip" {
#   name                = "${var.prefix}-ip"
#   location            = azurerm_resource_group.myresourcegroup.location
#   resource_group_name = azurerm_resource_group.myresourcegroup.name
#   allocation_method   = "Dynamic"
#   domain_name_label   = "${var.prefix}-meow"
# }