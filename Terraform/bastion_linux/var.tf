variable "bastionhost_address_prefix" {}
variable "rg_name" {} 
variable "sg_names" {}
variable "rg_location" {}
variable "sn_ids" {}
variable "vnet_id" {}


# type = "list"
#}

####Bastion host parameters

#variable "bastionhost_port" {}
variable "Bastionhost_vmname" {}
variable "Bastionhost_username" {}
variable "Bastionhost_password" {}
variable "Bastionhost-publicIP_name" {}
variable "Bastionhost_vmsize" {}
variable "CloudinitscriptPath" 
{
default     = ""

}




variable "vm_os_simple" {
  description = "Specify UbuntuServer, WindowsServer, RHEL, openSUSE-Leap, CentOS, Debian, CoreOS and SLES to get the latest image version of the specified os.  Do not provide this value if a custom value is used for vm_os_publisher, vm_os_offer, and vm_os_sku."
  default     = ""
}

variable "vm_os_id" {
 description = "The resource ID of the image that you want to deploy if you are using a custom image.Note, need to provide is_windows_image = true for windows custom images."
  default     = ""
}

variable "is_windows_image" {
  description = "Boolean flag to notify when the custom image is windows based. Only used in conjunction with vm_os_id"
  default     = "false"
}

variable "vm_os_publisher" {
  description = "The name of the publisher of the image that you want to deploy. This is ignored when vm_os_id or vm_os_simple are provided."
  default     = ""
}

variable "vm_os_offer" {
 description = "The name of the offer of the image that you want to deploy. This is ignored when vm_os_id or vm_os_simple are provided."
  default     = ""
}

variable "vm_os_sku" {
 description = "The sku of the image that you want to deploy. This is ignored when vm_os_id or vm_os_simple are provided."
  default     = ""
}

variable "vm_os_version" {
 description = "The version of the image that you want to deploy. This is ignored when vm_os_id or vm_os_simple are provided."
 default     = "latest"
}
variable "remote_port" {
  description = "Remote tcp port to be used for access to the vms created via the nsg applied to the nics."
 default     = ""
}
