variable "name" {
  type = "string"
}

variable "engine" {
  type = "string"
}

variable "engine_version" {
  type = "string"
}

variable "subnets" {
  type = "list"
}

variable "vpc_id" {
  type = "string"
}

variable "replica_count" {}

variable "replica_scale_enabled" {}

variable "replica_scale_min" {}
variable "replica_scale_max" {}
variable "monitoring_interval" {}
variable "instance_type" {}
variable "apply_immediately" {}
variable "skip_final_snapshot" {}

variable "enabled_cloudwatch_logs_exports" {
  type    = "list"
  default = ["audit", "error", "general", "slowquery"]
}

variable "family" {}

variable "database_name" {}
variable "master_username" {}
variable "master_password" {}
variable "kms_key_id" {}
