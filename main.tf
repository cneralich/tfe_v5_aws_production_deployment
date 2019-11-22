provider "aws" {
  region = "${var.region}"
}

module "bootstrap" {
  source = "github.com/cneralich/private-terraform-enterprise//examples/bootstrap-aws"
}

module "external_services" {
  source = "github.com/cneralich/terraform_v5_aws_external_services"
  
  vpc_id = "${module.bootstrap.vpc_id}"
  install_id = "${var.project_name}"
  prefix = "${var.prefix}"
  subnet_ids = "${module.bootstrap.all_subnet_ids}"
  cidr_blocks = "${module.bootstrap.all_cidr_blocks}"
}

module "tfe-cluster" {
  source  = "github.com/cneralich/terraform-aws-terraform-enterprise"
  #version = "0.1.0"

  vpc_id       = "${module.bootstrap.vpc_id}"
  domain       = "${var.domain}"
  hostname =  "${var.hostname}"
  project_name = "${var.project_name}"

  cert_domain  = "${var.hostname}.${var.domain}"
  create_cert = "${var.create_cert}"
  license_file = "${var.license_file}"

  public_subnets              = "${module.bootstrap.public_subnets}"
  private_subnets             = "${module.bootstrap.private_subnets}"
  public_subnets_cidr_blocks  = "${module.bootstrap.public_subnets_cidr_blocks}"
  private_subnets_cidr_blocks = "${module.bootstrap.private_subnets_cidr_blocks}"

  s3_bucket = "${module.external_services.s3_bucket}"
  s3_region = "${module.external_services.s3_region}"
  aws_access_key_id = "${module.external_services.iam_access_key}"
  aws_secret_access_key = "${module.external_services.iam_secret_key}"

  postgresql_address  = "${module.external_services.database_endpoint}"
  postgresql_database = "${module.external_services.database_name}"
  #postgresql_extra_params = ""
  postgresql_user     = "${module.external_services.database_username}"
  postgresql_password = "${module.external_services.database_password}"
}