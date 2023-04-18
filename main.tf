
module "lz" {
  source = "./modules/network"

  count = (var.create_lz ? 1 : 0)

  prefix      = try(var.prefix)
  location    = try(var.location)
  environment = try(var.environment)
}

module "app" {
  source = "./modules/hashicat"

  count = (var.create_app ? 1 : 0)
  prefix        = try(var.prefix)
  location      = try(var.location)
  subnet_prefix = try(var.subnet_prefix)
  environment   = try(var.environment)
  placeholder   = try(var.placeholder)
}

module "db" {
  source = "./modules/hashicat"

  count = (var.create_db ? 1 : 0)
  prefix        = try(var.prefix)
  location      = try(var.location)
  subnet_prefix = try(var.subnet_prefix)
  environment   = try(var.environment)
  placeholder   = try(var.placeholder)
}

output "network" {
  value = module.lz
}

output "app" {
  value = try(module.app)
}

output "db" {
  value = try(module.db)
}