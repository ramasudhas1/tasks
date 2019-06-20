
###Network components

variable "rg_name" {}
variable "project_name" {}
variable "location" {}
variable "vnet_name" {}
variable "address_space" {}

variable "sg_names" {
  type = "list"
}

variable "subnet_names" {
  type = "list"
}

variable "subnet_prefixes" {
  type = "list"
}

