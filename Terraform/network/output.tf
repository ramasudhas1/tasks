

output "rg_location" {
value       = "${azurerm_resource_group.test.location}"
}

output "rg_name" {
value       = "${azurerm_resource_group.test.name}"
}
output "vnet_id" {
value       = "${azurerm_virtual_network.test.id}"
}





output "sg_names" {
value       = "${azurerm_network_security_group.test.*.name}"
}


output "sn_ids" {
value       = "${azurerm_subnet.subnet.*.id}"
}

