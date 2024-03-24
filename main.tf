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
  component     = "frontend"
  env           = var.env
  zone_id       = var.zone_id
}