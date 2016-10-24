variable "access_key" {
  description = "AWS Access Key"
}
variable "asecret_key" {
  description = "AWS Secret Key"
}

variable "region" {
  default = "eu-west-1"
  description = "AWS region"
}

variable "subnet_1_cidr" {
  default     = "172.31.64.0/24"
  description = "CIDR for 1st subnet"
}

variable "subnet_2_cidr" {
  default     = "172.31.128.0/24"
  description = "CIDR for 2nd subnet"
}

variable "az_1" {
  default     = "eu-west-1a"
  description = "Availability zone"
}

variable "az_2" {
  default     = "eu-west-1b"
  description = "Availability zone"
}

variable "vpc_id" {
  description = "Default VPC ID"
}

variable "identifier" {
  description = "Database identifier. Unique per RDS node"
}

variable "storage" {
  default     = "250"
  description = "200G < RDS storage size < 6TB. Default value:250G"
}

variable "storage_type" {
  default     = "gp2"
  description = "RDS storage type. Default: gp2"
}


variable "engine" {
  default     = "sqlserver-se"
  description = "RDS engine type. Default: MSSQL Server Standart Edition"
}

variable "license_mod" {
  default     = "license-included"
  description = "MSSQL SE license model"
}

variable "multi_az" {
  default     = "False"
  description = "RDS multi-az deployment. Default: false"
}

variable "pub_access" {
  default     = "True"
  description = "RDS public access. Default: true"
}

variable "retention_period" {
  default     = "30"
  description = "RDS snapshot retention period. Default: 30 days"
}

variable "engine_version" {
  description = "Engine version"
  default = {
    sqlserver-se = "12.00.4422.0.v1"
  }
}

variable "instance_class" {
  default     = "db.m3.medium"
  description = "Instance class"
}

variable "username" {
  default     = "sa"
  description = "RDS root user name"
}

variable "password" {
  description = "RDS root user password (at least 8 characters)."
}
