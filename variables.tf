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

variable "redis_enabled" {
  default     = false
  description = "Specify whether the redis cluster is enabled"
}

variable "kms_enabled" {
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
  default     = "POSTGRES_15"
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
  default     = false
  description = "Specify whether the CSI driver is enabled"
}

variable "tags" {
  description = "Terraform map to create custom tags for the Google resources"
  default     = {}
}

variable "name" {
  type        = string
  default     = "test"
  description = "Name of the resource. Provided by the client when the resource is created. "
}


variable "location" {
  type        = string
  default     = ""
  description = "The location (region or zone) in which the cluster master will be created, as well as the default node location."
}

variable "remove_default_node_pool" {
  type        = bool
  default     = true
  description = "deletes the default node pool upon cluster creation."
}

variable "initial_node_count" {
  type        = number
  default     = 0
  description = "The number of nodes to create in this cluster's default node pool."
}

variable "service_account" {
  type        = string
  default     = ""
  description = "The Google Cloud Platform Service Account to be used by the node VMs created by GKE Autopilot or NAP."
}

variable "min_node_count" {
  type        = number
  default     = 1
  description = "Minimum number of nodes in the cluster."
}

variable "max_node_count" {
  type        = number
  default     = 1
  description = "Maximum number of nodes in the cluster."
}

variable "location_policy" {
  type        = string
  default     = "BALANCED"
  description = "Specifies the policy for distributing nodes across locations, with the default being BALANCED"
}

variable "auto_repair" {
  type        = bool
  default     = true
  description = "Enables or disables automatic repair of nodes in the cluster."
}

variable "auto_upgrade" {
  type        = bool
  default     = true
  description = "Enables or disables automatic upgrades of nodes in the cluster."
}

variable "image_type" {
  type        = string
  default     = ""
  description = "Type of image to use for the nodes in the cluster."
}

variable "machine_type" {
  type        = string
  default     = ""
  description = "Specifies the machine type for the nodes in the cluster."
}

variable "disk_size_gb" {
  type        = number
  default     = 10
  description = " Size of the disk in gigabytes for each node in the cluster."
}

variable "disk_type" {
  type        = string
  default     = ""
  description = " Type of disk to use for the nodes in the cluster."
}

variable "preemptible" {
  type        = bool
  default     = false
  description = "Specifies whether the nodes in the cluster should be preemptible."
}

variable "cluster_create_timeouts" {
  type        = string
  default     = "30m"
  description = "Timeout for creating the cluster."
}

variable "cluster_update_timeouts" {
  type        = string
  default     = "30m"
  description = "Timeout for updating the cluster."
}

variable "cluster_delete_timeouts" {
  type        = string
  default     = "30m"
  description = "Timeout for deleting the cluster."
}

variable "min_master_version" {
  type        = string
  default     = ""
  description = "The minimum version of the master. "
}