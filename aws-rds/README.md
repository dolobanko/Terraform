# Creating RDS instance with Terraform #

This script allows to run MSSQL/MySQL/PostgreSQL on AWS RDS using HashiCorp Terraform utility. The script as it is, will deploy MSSQL Standart Edition with some set of predefined variables. You will need to update them in an appropriate config file described below, if you want to modify deployment. 

All options are set as variables and could be modified.

## Configuration ##

### aws_proder.tf ###

This configuration file defines AWS credentials and region:

* `AWS_ACCESS_KEY_ID`
* `AWS_SECRET_ACCESS_KEY`
* `AWS_DEFAULT_REGION`

### output.tf ###

This configuration file describe terraform deployment output:

* `RDS instance_id`
* `RDS instance url`

### resources.tf ###

This configuration file defines resources to be deployed:

* `aws_db_instance` - RDS instance
* `aws_db_subnet_group` - RDS subnet group
* `aws_subnet` - VPC RDS subnets (2 for Multi-AZ deployments)
* `aws_security_group` - RDS security group

### variables.tf ###

This configuration file defines variables to use.  
Some variables has default values set. Please, review configuration before deployment.

## Usage ##

To run dry test:
`$ terraform plan`

To run deployment:
`$ terraform apply`

You will be promted to enter:

- `var.access_key` - your AWS access key
- `var.asecret_key` - your  AWS secret key
- `var.identifier` - your RDS instance identifier
- `var.password` - your MSSQL "sa" user password
- `var.vpc_id` - your DEFAULT VPC id (to change it see below)

To override default variable use syntax: `terraform plan -var 'avariable_to_override=value'`.  
To use Multi-AZ deployment override `multi_az` variable with value set in `true`.

## Important ##

This script uses `subnet_1_cidr` and `subnet_2_cidr` variables defined as subnets of defautl VPC.  
Therefore, you will need to set `var.vpc_id` variable within your default VPC ID or modify subnet_*_cidr variables.  
Options can be extended by adding appropriate `AWS_DB_INSTANCE` resource's parameters.
