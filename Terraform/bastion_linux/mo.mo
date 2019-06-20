#### To create the Linux bastion host server
module "bastion" {
source = "./bastion_linux"

rg_name  = "${module.network.rg_name}"
sg_names = "${module.network.sg_names[0]}"
rg_location ="${module.network.rg_location}"
sn_ids = "${module.network.sn_ids[0]}"
vnet_id = "${module.network.vnet_id}"

# Bastionhost parameters

bastionhost_address_prefix = ["45.112.36.0/22","103.4.124.0/22","213.33.93.211","40.118.40.136"]
Bastionhost_vmname = "bastionhost"
Bastionhost_username = "opsadmin"
Bastionhost_password = "Passw0rd!"
Bastionhost-publicIP_name = "Bastionhost-publicIP"
Bastionhost_vmsize = "Standard_A0"

#description = "Specify UbuntuServer, WindowsServer, RHEL, openSUSE-Leap, CentOS, Debian, CoreOS"
vm_os_simple = "UbuntuServer"


}

