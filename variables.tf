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

variable "master_username" {
  type = "string"

  //  default = "AQICAHiJry92zgaqTuHrw23xcXltrvX0lMF10kWCAqDiVZWUzgENEeoKOZ7Qun9M5jc+3lt+AAAAZjBkBgkqhkiG9w0BBwagVzBVAgEAMFAGCSqGSIb3DQEHATAeBglghkgBZQMEAS4wEQQMAforNFWubNK5v1DJAgEQgCNsm2PtYZTtbL1kkTfx2YX9RnaHDDffa78HFiH8/AYgYcywyw=="
}

variable "master_password" {
  type = "string"

  //  default = "AQICAHiJry92zgaqTuHrw23xcXltrvX0lMF10kWCAqDiVZWUzgG2jY4ggDUCMVGrcsQ5ut9qAAAAbDBqBgkqhkiG9w0BBwagXTBbAgEAMFYGCSqGSIb3DQEHATAeBglghkgBZQMEAS4wEQQMVuZinpRWdPW4cM/ZAgEQgCnt+8QDg/RfWsiWhAIChGWg6tBTrfX+dMlqTVNWGay9C57z/mx0GMxklg=="
}

variable "kms_key_id" {}
variable "backup_retention_period" {}
variable "preferred_backup_window" {}
variable "preferred_maintenance_window" {}
