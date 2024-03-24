# terraform {
#     backend "s3"{}
# }

# output "sample" {
#     value = var.env
# }

# variable "env"{}

# enter module here

module "frontend" {
  source        = "./modules/app"
  instance_type = var.instance_type
  component     = var.component
  env           = var.env
  zone_id       = var.zone_id
}


module "backend" {
  depends_on = [module.mysql]

  source        = "./modules/app"
  instance_type = var.instance_type
  component     = "backend"
  env           = var.env
  zone_id       = var.zone_id
}

module "mysql" {
  source        = "./modules/app"
  instance_type = var.instance_type
  component     = "mysql"
  env           = var.env
  zone_id       = var.zone_id
}