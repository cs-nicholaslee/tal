variable "lz_prefix" { default = "" }
variable "app_prefix" { default = "" } 
variable "db_prefix" { default = "" }

variable "lz_location" { default = "" }
variable "app_location" { default = "" }
variable "db_location" { default = "" }

variable "lz_environment" { default = "" }
variable "app_environment" { default = "" }
variable "db_environment" { default = "" }

variable "app_subnet_prefix" { default = "" }
variable "db_subnet_prefix" { default = "" }

variable "app_placeholder" { default = "" }
variable "db_placeholder" { default = "" }

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