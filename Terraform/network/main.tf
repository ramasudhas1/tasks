resource "azurerm_resource_group" "test" {
  name     = "${var.rg_name}"
  location = "${var.location}"

  tags {
    name = "${var.project_name}"
  }
}

resource "azurerm_virtual_network" "test" {
  name                = "${var.vnet_name}"
  address_space       = ["${var.address_space}"]
  location            = "${azurerm_resource_group.test.location}"
  resource_group_name = "${azurerm_resource_group.test.name}"
}

resource "azurerm_network_security_group" "test" {
  count               = "${length(var.sg_names)}"
  name                = "${element(var.sg_names,count.index)}"
  location            = "${azurerm_resource_group.test.location}"
  resource_group_name = "${azurerm_resource_group.test.name}"
}

#output "network_security_group_id" {
#  description = "id of the security group provisioned"
#  value       = "${azurerm_network_security_group.test.*.id}"

  # value = "${join(",", aws_subnet.public.*.id)}"
#}

resource "azurerm_subnet" "subnet" {
  name                      = "${element(var.subnet_names,count.index)}"
  virtual_network_name      = "${azurerm_virtual_network.test.name}"
  resource_group_name       = "${azurerm_resource_group.test.name}"
  address_prefix            = "${element(var.subnet_prefixes,count.index)}"
  count                     = "${length(var.sg_names)}"
  network_security_group_id = "${element(azurerm_network_security_group.test.*.id,count.index)}"
}

