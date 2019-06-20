module "os" {
  source       = "./os"
  vm_os_simple = "${var.vm_os_simple}"
}

resource "azurerm_network_security_rule" "bastion_host" {
  name                   = "ssh-access-rule"
  priority               = 100
  direction              = "Inbound"
  access                 = "Allow"
  protocol               = "Tcp"
  source_port_range      = "*"
  #destination_port_range = "${var.bastionhost_port}"
  destination_port_range = "${var.vm_os_id == "" ? coalesce(var.remote_port, module.os.calculated_remote_port) : ""}"

  #source_address_prefixes       = "${var.bastionhost_address_prefix}"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = "${var.rg_name}"
  network_security_group_name = "${var.sg_names}"
}

###VM creation

resource "azurerm_public_ip" "test" {
  name                         = "${var.Bastionhost-publicIP_name}"
  location                     = "${var.rg_location}"
  resource_group_name          = "${var.rg_name}"
  public_ip_address_allocation = "static"

  tags {
    environment = "Production"
  }
}




resource "azurerm_network_interface" "main" {
  name                = "test-nic-${var.Bastionhost_vmname}"
  location            = "${var.rg_location}"
  resource_group_name = "${var.rg_name}"

  ip_configuration {
    name                          = "testconfiguration1"
    subnet_id                     = "${var.sn_ids}"
    private_ip_address_allocation = "dynamic"
    public_ip_address_id = "${azurerm_public_ip.test.id}"

  }
}

data "template_file" "cloudconfig" {
  #template = "${file("./script.sh")}"
  template = "${file("${var.CloudinitscriptPath}")}"
}

data "template_cloudinit_config" "config" {
  gzip          = true
  base64_encode = true

  part {
    content = "${data.template_file.cloudconfig.rendered}"
  }
}


resource "azurerm_virtual_machine" "main" {
  name                  = "${var.Bastionhost_vmname}"
  location              = "${var.rg_location}"
  resource_group_name   = "${var.rg_name}"
  #network_interface_ids = "${azurerm_network_interface.main.id}"
  network_interface_ids = ["${azurerm_network_interface.main.*.id}"]
  #primary_network_interface_id = "${azurerm_network_interface.main.id}"
  vm_size               = "${var.Bastionhost_vmsize}"
  

  # Uncomment this line to delete the OS disk automatically when deleting the VM
  delete_os_disk_on_termination = true

  # Uncomment this line to delete the data disks automatically when deleting the VM
  delete_data_disks_on_termination = true
  storage_image_reference {
    id        = "${var.vm_os_id}"
    publisher = "${var.vm_os_id == "" ? coalesce(var.vm_os_publisher, module.os.calculated_value_os_publisher) : ""}"
    offer     = "${var.vm_os_id == "" ? coalesce(var.vm_os_offer, module.os.calculated_value_os_offer) : ""}"
    sku       = "${var.vm_os_id == "" ? coalesce(var.vm_os_sku, module.os.calculated_value_os_sku) : ""}"
    version   = "${var.vm_os_id == "" ? var.vm_os_version : ""}"
}

#  storage_image_reference {
#    publisher = "Canonical"
#    offer     = "UbuntuServer"
#    sku       = "16.04-LTS"
#    version   = "latest"
#  }

  storage_os_disk {
    name              = "Bastionosdisk1-${var.Bastionhost_vmname}"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  os_profile {
    computer_name  = "${var.Bastionhost_vmname}"
    admin_username = "${var.Bastionhost_username}"
    admin_password = "${var.Bastionhost_password}"
  }

  os_profile_linux_config {
   disable_password_authentication = false
  }

  tags {
    environment = "Production"
  }
}
output "Bastionhost-publicIP"
{
  description = "id of the security group provisioned"
  value       = "${azurerm_public_ip.test.id}"

}
