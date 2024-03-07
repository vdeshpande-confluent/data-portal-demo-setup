locals {
  description = "Resource created using terraform for data portal demo"
}

resource "random_id" "id" {
  byte_length = 4
}

# ----------------------------------------
# Confluent Cloud Kafka cluster variables
# ----------------------------------------
variable "cc_cloud_provider" {
  type    = string
  default = "AWS"
}

variable "cc_cloud_region" {
  type    = string
  default = "us-east-1"
}

variable "cc_cluster_name" {
  type    = string
  default = "data-portal"
}

variable "cc_availability" {
  type    = string
  default = "SINGLE_ZONE"
}


# ------------------------------------------
# Confluent Cloud Schema Registry variables
# ------------------------------------------
variable "sr_cloud_provider" {
  type    = string
  default = "AWS"
}

variable "sr_cloud_region" {
  type    = string
  default = "us-east-1"
}

variable "sr_package" {
  type    = string
  default = "ADVANCED"
}

# --------------------------------------------
# Confluent Cloud Flink Compute Pool variables
# --------------------------------------------
variable "cc_dislay_name" {
  type    = string
  default = "standard_compute_pool"
}

variable "cc_compute_pool_name" {
  type    = string
  default = "cc_demo_flink"
}

variable "cc_compute_pool_cfu" {
  type    = number
  default = 5
}
