### Module used for creating the network components

module "network" {
source = "./network"

rg_name = "iTraMs_RG01"
project_name = "iTraMS"
location = "West US"
vnet_name = "iTraMs_Vnet01"
address_space = "192.168.0.0/16"
sg_names = ["DMZ_MANAGEMENT_NSG01","APP_NSG01","DB_NSG01","GW_NSG01","WEB_NSG01" ]
subnet_names = ["DMZ_MANAGEMENT_SN01","APP_SN01","DB_SN01","GW_SN01","WEB_SN01" ]
subnet_prefixes = ["192.168.0.16/28","192.168.0.64/27","192.168.0.96/27","192.168.0.0/28","192.168.0.32/27" ]
}

