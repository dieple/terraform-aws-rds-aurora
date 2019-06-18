provider "aws" {
  region = "eu-west-1"
}

//data "aws_kms_secrets" "aurora" {
//  secret {
//    name    = "master_password"
//    payload = "${var.master_password}"
//  }
//
//  secret {
//    name    = "master_username"
//    payload = "${var.master_username}"
//  }
//}

module "aurora" {
  source  = "terraform-aws-modules/rds-aurora/aws"
  version = "~> 1.0"

  username = "${var.master_username}"
  password = "${var.master_password}"

  kms_key_id    = "${var.kms_key_id}"
  name          = "${var.name}"
  database_name = "${var.database_name}"

  //  password                        = "${data.aws_kms_secrets.aurora.plaintext["master_password"]}"
  //  username                        = "${data.aws_kms_secrets.aurora.plaintext["master_username"]}"
  engine = "${var.engine}"

  engine_version                  = "${var.engine_version}"
  subnets                         = "${var.subnets}"
  vpc_id                          = "${var.vpc_id}"
  replica_count                   = "${var.replica_count}"
  replica_scale_enabled           = "${var.replica_scale_enabled}"
  replica_scale_min               = "${var.replica_scale_min}"
  replica_scale_max               = "${var.replica_scale_max}"
  monitoring_interval             = "${var.monitoring_interval}"
  instance_type                   = "${var.instance_type}"
  apply_immediately               = "${var.apply_immediately}"
  skip_final_snapshot             = "${var.skip_final_snapshot}"
  db_parameter_group_name         = "${aws_db_parameter_group.db_param_group.id}"
  db_cluster_parameter_group_name = "${aws_rds_cluster_parameter_group.db_cluster_pg.id}"
  backup_retention_period         = "${var.backup_retention_period}"
  preferred_backup_window         = "${var.preferred_backup_window}"
  preferred_maintenance_window    = "${var.preferred_maintenance_window}"
}

resource "aws_db_parameter_group" "db_param_group" {
  name        = "${var.name}-db-instance-pg"
  family      = "${var.family}"
  description = "automic db postgres10 parameter group"

  parameter {
    name  = "shared_preload_libraries"
    value = "pg_stat_statements"
  }

  parameter {
    name  = "log_lock_waits"
    value = "on"
  }

  parameter {
    name  = "idle_in_transaction_session_timeout"
    value = "5"
  }

  parameter {
    name  = "pg_stat_statements.track_utility"
    value = "on"
  }

  parameter {
    name  = "random_page_cost"
    value = "1.0"
  }
}

resource "aws_rds_cluster_parameter_group" "db_cluster_pg" {
  name        = "${var.name}-cluster-pg"
  family      = "${var.family}"
  description = "automic db cluster postgres10 parameter group"

  parameter {
    name  = "autovacuum_vacuum_cost_delay"
    value = "0"
  }

  parameter {
    name  = "vacuum_cost_limit"
    value = "10000"
  }

  parameter {
    name  = "autovacuum_vacuum_scale_factor"
    value = "0.01"
  }

  parameter {
    name  = "autovacuum_naptime"
    value = "1"
  }
}
