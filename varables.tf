# ResourceGroup VB
variable "rgName" {
  type    = string
  default = "tfazrg01"
}

variable "location" {
  type    = string
  default = "norwayeast"
}

#StorageAccount
variable "StorageAccount" {
  type    = string
  default = "tfazstg01"
}
variable "account_tier" {
  type    = string
  default = "Standard"
}

variable "account_replication_type" {
  type    = string
  default = "LRS"
}

variable "STGContainer" {
  type    = string
  default = "tfazcont01"
}