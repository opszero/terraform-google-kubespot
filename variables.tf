variable "environment_name" {
  type        = string
  description = "The name of the environment to create resources"
}

variable "cluster_version" {
  default     = "1.27"
  description = "The minimum version of the master"
}

variable "region" {
  default     = "us-central1"
  description = "The location (region or zone) in which the cluster master will be created"
}

variable "project" {
  type        = string
  description = "The Google Project that will host the cluster"
}

variable "nodes_instance_type" {
  default     = "n1-standard-1"
  description = "The name of a Google Compute Engine machine type. Defaults to e2-medium"
}

variable "nodes_desired_capacity" {
  default     = 1
  description = "Desired number of nodes in the NodePool"
}

variable "nodes_min_size" {
  default     = 1
  description = "Minimum number of nodes in the NodePool. Must be >=0 and <= max_node_count"
}

variable "nodes_max_size" {
  default     = 1
  description = "Maximum number of nodes in the NodePool. Must be >= min_node_count"
}

variable "redis_enabled" {
  default     = false
  description = "Specify whether the redis cluster is enabled"
}

variable "redis_memory_in_gb" {
  default     = 1
  description = "Redis memory size in GiB"
}

variable "redis_ha_enabled" {
  default     = false
  description = "Specify whether HA is enabled for redis"
}

variable "sql_enabled" {
  default     = false
  description = "Specify whether the sql instance is enabled"
}

variable "sql_engine" {
  default     = "POSTGRES_13"
  description = "The sql version to use"
}

variable "sql_instance_class" {
  default     = "db-f1-micro"
  description = "The machine type to use"
}

variable "sql_master_username" {
  default     = ""
  description = "The name of the db user"
}

variable "sql_master_password" {
  default     = ""
  description = "The password for the db user"
}

variable "csi_secrets_store_enabled" {
  default     = true
  description = "Specify whether the CSI driver is enabled"
}
