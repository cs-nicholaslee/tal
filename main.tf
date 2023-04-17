
module "lz" {
  source = "./modules/network"

  count = var.lz_prefix != null && var.lz_location != null && var.lz_environment != null ? 1:0

  prefix      = try(var.lz_prefix)
  location    = try(var.lz_location)
  environment = try(var.lz_environment)
}

module "app" {
  source = "./modules/hashicat"

  count         = var.app_prefix != null && var.app_location != null && var.app_subnet_prefix != null && var.app_environment != null && var.app_placeholder != null ? 1 : 0
  prefix        = try(var.app_prefix)
  location      = try(var.app_location)
  subnet_prefix = try(var.app_subnet_prefix)
  environment   = try(var.app_environment)
  placeholder   = try(var.app_placeholder)
}

module "db" {
  source = "./modules/hashicat"

  count         = var.db_prefix != null && var.db_location != null && var.db_subnet_prefix != null && var.db_environment != null && var.db_placeholder != null ? 1 : 0
  prefix        = try(var.db_prefix)
  location      = try(var.db_location)
  subnet_prefix = try(var.db_subnet_prefix)
  environment   = try(var.db_environment)
  placeholder   = try(var.db_placeholder)
}

