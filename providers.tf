terraform {
  required_providers {
    confluent = {
      source  = "confluentinc/confluent"
      version = "1.54.0"
    }
    external = {
      source  = "hashicorp/external"
      version = "2.3.1"
    }
 
  }
}



data "external" "env_vars" {
  program = ["./shell/env_terraform.sh"]
}

provider "confluent" {
  cloud_api_key = data.external.env_vars.result.CONFLUENT_CLOUD_API_KEY
  cloud_api_secret = data.external.env_vars.result.CONFLUENT_CLOUD_API_SECRET
 
}



