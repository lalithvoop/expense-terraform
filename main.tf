terraform {
    backend "s3"{}
}

output "sample" {
    value = var.env
}

variable "env"{}