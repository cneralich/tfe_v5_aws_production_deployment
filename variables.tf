variable "license_file" {
  type        = "string"
  description = "License file"
}

variable "hostname" {
    description = "the DNS hostname you will use to access PTFE"
}

variable "domain" {
  description = "the PTFE domain name"
}

variable "route53_zone" {
  description = "Name of Route53 zone to use"
}

variable "create_cert" {
  description = "indicate if a cert should be created"
  default = false
}

variable "project_name" {
  description = "name to attach to external services components"
  default = "tfe"
}

variable "prefix" {
  type        = "string"
  description = "string to prefix all resources with "
}

variable "region" {
  description = "region into which you will deploy terraform enterprise"
}