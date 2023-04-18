variable "prefix" { default = "" }
variable "location" { default = "" }
variable "environment" { default = "" }
variable "subnet_prefix" { default = "" }
variable "placeholder" { default = "" }

variable "create_lz" {
  type = bool
  default = false
}

variable "create_app" {
  type = bool
  default = false
}

variable "create_db" {
  type = bool
  default = false
}