variable "lz_prefix" {}
variable "app_prefix" {}
variable "db_prefix" {}

variable "lz_location" {}
variable "app_location" {}
variable "db_location" {}

variable "lz_environment" {}
variable "app_environment" {}
variable "db_environment" {}

variable "app_subnet_prefix" {}
variable "db_subnet_prefix" {}

variable "app_placeholder" {}
variable "db_placeholder" {}

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