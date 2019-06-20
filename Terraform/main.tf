### Module used for creating the network components 

module "network" {
source = "./network"

rg_name = "ramtest_RG01"
project_name = "ramtest"
location = "southcentralus"
vnet_name = "ramtest_Vnet01"
address_space = "192.168.0.0/16"
sg_names = ["DMZ_MANAGEMENT_NSG01","APP_NSG01","DB_NSG01","GW_NSG01","WEB_NSG01" ]
subnet_names = ["DMZ_MANAGEMENT_SN01","APP_SN01","DB_SN01","GW_SN01","WEB_SN01" ]
subnet_prefixes = ["192.168.0.16/28","192.168.0.64/27","192.168.0.96/27","192.168.0.0/28","192.168.0.32/27" ]
}



#### To create the Linux  server
module "server1" {
source = "./bastion_linux"

rg_name  = "${module.network.rg_name}"
sg_names = "${module.network.sg_names[0]}"
rg_location ="${module.network.rg_location}"
sn_ids = "${module.network.sn_ids[0]}"
vnet_id = "${module.network.vnet_id}"

# Bastionhost parameters

bastionhost_address_prefix = ["0.0.0.0"]
Bastionhost_vmname = "master"
Bastionhost_username = "opsadmin"
Bastionhost_password = ""
Bastionhost-publicIP_name = "Bastionhost-publicIP1"
Bastionhost_vmsize = "Standard_B2ms"
CloudinitscriptPath = "/c/mstaxx/scripts/initscript.sh"

#description = "Specify UbuntuServer, WindowsServer, RHEL, openSUSE-Leap, CentOS, Debian, CoreOS"
vm_os_simple = "UbuntuServer"

}


#############################

module "server2" {
source = "./bastion_linux"

rg_name  = "${module.network.rg_name}"
sg_names = "${module.network.sg_names[0]}"
rg_location ="${module.network.rg_location}"
sn_ids = "${module.network.sn_ids[0]}"
vnet_id = "${module.network.vnet_id}"

# Bastionhost parameters

bastionhost_address_prefix = ["0.0.0.0"]
Bastionhost_vmname = "node1"
Bastionhost_username = "opsadmin"
Bastionhost_password = ""
Bastionhost-publicIP_name = "Bastionhost-publicIP2"
Bastionhost_vmsize = "Standard_B2ms"
CloudinitscriptPath = "/c/mstaxx/scripts/initscript.sh"

#description = "Specify UbuntuServer, WindowsServer, RHEL, openSUSE-Leap, CentOS, Debian, CoreOS"
vm_os_simple = "UbuntuServer"

}
#############################
module "server3" {
source = "./bastion_linux"

rg_name  = "${module.network.rg_name}"
sg_names = "${module.network.sg_names[0]}"
rg_location ="${module.network.rg_location}"
sn_ids = "${module.network.sn_ids[0]}"
vnet_id = "${module.network.vnet_id}"

# Bastionhost parameters

bastionhost_address_prefix = ["0.0.0.0"]
Bastionhost_vmname = "node2"
Bastionhost_username = "opsadmin"
Bastionhost_password = ""
Bastionhost-publicIP_name = "Bastionhost-publicIP3"
Bastionhost_vmsize = "Standard_B2ms"
CloudinitscriptPath = "/c/mstaxx/scripts/initscript.sh"

#description = "Specify UbuntuServer, WindowsServer, RHEL, openSUSE-Leap, CentOS, Debian, CoreOS"
vm_os_simple = "UbuntuServer"

}
#####################

module "server4" {
source = "./bastion_linux"

rg_name  = "${module.network.rg_name}"
sg_names = "${module.network.sg_names[0]}"
rg_location ="${module.network.rg_location}"
sn_ids = "${module.network.sn_ids[0]}"
vnet_id = "${module.network.vnet_id}"

# Bastionhost parameters

bastionhost_address_prefix = ["0.0.0.0"]
Bastionhost_vmname = "jenkins"
Bastionhost_username = "opsadmin"
Bastionhost_password = ""
Bastionhost-publicIP_name = "Bastionhost-publicIP4"
Bastionhost_vmsize = "Standard_B2ms"
CloudinitscriptPath = "/c/mstaxx/scripts/initscript.sh"

#description = "Specify UbuntuServer, WindowsServer, RHEL, openSUSE-Leap, CentOS, Debian, CoreOS"
vm_os_simple = "UbuntuServer"

}
