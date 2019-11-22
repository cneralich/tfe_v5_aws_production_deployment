This Repo can be used to deploy Terraform Enterprise (v5) into your AWS environment in Production Mode. This will first create a VPC, Subnets, S3 Bucket, Postgres Database, Firewalls, Route53 Record, and Certificate in your AWS ennvironment before deploying the Application. 

## Modules Used

- [Customized AWS Bootstrap Module](https://github.com/cneralich/private-terraform-enterprise/tree/master/examples/bootstrap-aws) 
- [Customized AWS External Services](https://github.com/cneralich/terraform_v5_aws_external_services)
- [Customized TFE AWS Module](https://github.com/cneralich/terraform-aws-terraform-enterprise)

## Pre-Requisites

Terraform Version
- This Repo uses Modules that require a Terraform version of <0.12.x.  The recommended Terraform version to use is 0.11.14.

The following items must be configured prior to using this Module:

- Valid AWS Credentials (set as Environment Variables)
- A valid Route53 Zone
- A Terraform Enterprise License

## Required Variables

- `license_file` -- License file
- `hostname` -- DNS hostname you will use to access PTFE
- `domain` -- the PTFE domain name
- `route53_zone` -- Existing Route53 Zone
- `prefix` -- Prefix to append to resources
- `region` -- Region where the Application will be deployed

## Optional Variables

- `create_cert` -- Indicate if a cert should be created
- `project_name` -- Name to attach to external services components

## How to Use this Repo

- Update the values in the terraform.tfvars file 
- Run `terraform plan` and `terraform apply`
