# resource "confluent_tag" "PII" {
#   schema_registry_cluster {
#     id = data.confluent_schema_registry_cluster.cc_sr_cluster.id
#   }
#   rest_endpoint = data.confluent_schema_registry_cluster.cc_sr_cluster.rest_endpoint
#   credentials {
#    key    = confluent_api_key.app-manager-schema-api-key.id
#    secret = confluent_api_key.app-manager-schema-api-key.secret
#   }

#   name = "PII_01"
#   description = "Contains sensitive data that can directly identify an individual, such as name, address, Social Security number, date of birth, and contact information."

#   lifecycle {
#  prevent_destroy = false
#  }
# }


# resource "confluent_tag" "Security" {
#   schema_registry_cluster {
#     id = data.confluent_schema_registry_cluster.cc_sr_cluster.id
#   }
#   rest_endpoint = data.confluent_schema_registry_cluster.cc_sr_cluster.rest_endpoint
#   credentials {
#    key    = confluent_api_key.app-manager-schema-api-key.id
#    secret = confluent_api_key.app-manager-schema-api-key.secret
#   }

#   name = "SECURITY"
#   description = "Stores data related to security measures and access controls, including user authentication information, login attempts, security logs, and encryption keys."

#     lifecycle {
#  prevent_destroy = false
#  }
# }


# resource "confluent_tag" "Private" {
#   schema_registry_cluster {
#     id = data.confluent_schema_registry_cluster.cc_sr_cluster.id
#   }
#   rest_endpoint = data.confluent_schema_registry_cluster.cc_sr_cluster.rest_endpoint
#   credentials {
#    key    = confluent_api_key.app-manager-schema-api-key.id
#    secret = confluent_api_key.app-manager-schema-api-key.secret
#   }

#   name = "PRIVATE"
#   description = "Contains confidential information restricted to authorized personnel only, such as internal notes, employee details, and proprietary business data. Access to this data is restricted to ensure confidentiality and protect sensitive information from unauthorized access or disclosure."

#     lifecycle {
#  prevent_destroy = false
#  }
# }

# resource "confluent_tag" "Sensitive" {
#   schema_registry_cluster {
#     id = data.confluent_schema_registry_cluster.cc_sr_cluster.id
#   }
#   rest_endpoint = data.confluent_schema_registry_cluster.cc_sr_cluster.rest_endpoint
#   credentials {
#    key    = confluent_api_key.app-manager-schema-api-key.id
#    secret = confluent_api_key.app-manager-schema-api-key.secret
#   }

#   name = "SENSITIVE"
#   description = "Includes highly confidential information that requires special protection, such as credit card numbers, CVV codes, account numbers, and financial transaction details."

#     lifecycle {
#  prevent_destroy = false
#  }
# }

# resource "confluent_tag" "Public" {
#   schema_registry_cluster {
#     id = data.confluent_schema_registry_cluster.cc_sr_cluster.id
#   }
#   rest_endpoint = data.confluent_schema_registry_cluster.cc_sr_cluster.rest_endpoint
#   credentials {
#    key    = confluent_api_key.app-manager-schema-api-key.id
#    secret = confluent_api_key.app-manager-schema-api-key.secret
#   }

#   name = "PUBLIC"
#   description = "Contains demographic information, preferences, and other details about customers which can be publicly accessible"

#     lifecycle {
#  prevent_destroy = false
#  }
# }


# resource "confluent_tag" "Financial" {
#   schema_registry_cluster {
#     id = data.confluent_schema_registry_cluster.cc_sr_cluster.id
#   }
#   rest_endpoint = data.confluent_schema_registry_cluster.cc_sr_cluster.rest_endpoint
#   credentials {
#    key    = confluent_api_key.app-manager-schema-api-key.id
#    secret = confluent_api_key.app-manager-schema-api-key.secret
#   }

#   name = "FINANCIAL"
#   description = "Data related to financial transactions, account balances, and credit limits."
#     lifecycle {
#  prevent_destroy = false
#  }
# }

# resource "confluent_tag" "Fraudulent" {
#   schema_registry_cluster {
#     id = data.confluent_schema_registry_cluster.cc_sr_cluster.id
#   }
#   rest_endpoint = data.confluent_schema_registry_cluster.cc_sr_cluster.rest_endpoint
#   credentials {
#    key    = confluent_api_key.app-manager-schema-api-key.id
#    secret = confluent_api_key.app-manager-schema-api-key.secret
#   }

#   name = "FRAUDULENT"
#   description = "Data indicating suspicious or potentially fraudulent activity, such as unusual spending patterns or unauthorized transactions."

#     lifecycle {
#  prevent_destroy = false
#  }
# }
# resource "confluent_tag" "Transaction" {
#   schema_registry_cluster {
#     id = data.confluent_schema_registry_cluster.cc_sr_cluster.id
#   }
#   rest_endpoint = data.confluent_schema_registry_cluster.cc_sr_cluster.rest_endpoint
#   credentials {
#    key    = confluent_api_key.app-manager-schema-api-key.id
#    secret = confluent_api_key.app-manager-schema-api-key.secret
#   }

#   name = "TRANSACTION"
#   description = "Data related to individual transactions made using the credit card, such as transaction amount and merchant information."

#     lifecycle {
#  prevent_destroy = false
#  }
# }



# resource "confluent_tag_binding" "Transaction-binding-credit_card_transactions" {
#   schema_registry_cluster {
#     id = data.confluent_schema_registry_cluster.cc_sr_cluster.id
#   }
#   rest_endpoint = data.confluent_schema_registry_cluster.cc_sr_cluster.rest_endpoint
#   credentials {
#    key    = confluent_api_key.app-manager-schema-api-key.id
#    secret = confluent_api_key.app-manager-schema-api-key.secret
#   }

#   tag_name = "TRANSACTION"
#   entity_name = "${data.confluent_schema_registry_cluster.cc_sr_cluster.id}:${confluent_kafka_cluster.cc_kafka_cluster.id}:${confluent_kafka_topic.credit_card_transactions.topic_name}"
#   entity_type = "kafka_topic"

#     lifecycle {
#  prevent_destroy = false
#  }
# }

# resource "confluent_tag_binding" "Financial-binding-credit_card_transactions" {
#   schema_registry_cluster {
#     id = data.confluent_schema_registry_cluster.cc_sr_cluster.id
#   }
#   rest_endpoint = data.confluent_schema_registry_cluster.cc_sr_cluster.rest_endpoint
#   credentials {
#    key    = confluent_api_key.app-manager-schema-api-key.id
#    secret = confluent_api_key.app-manager-schema-api-key.secret
#   }

#   tag_name = "FINANCIAL"
#   entity_name = "${data.confluent_schema_registry_cluster.cc_sr_cluster.id}:${confluent_kafka_cluster.cc_kafka_cluster.id}:${confluent_kafka_topic.credit_card_transactions.topic_name}"
#   entity_type = "kafka_topic"

#     lifecycle {
#  prevent_destroy = false
#  }
# }


# resource "confluent_tag_binding" "Public-binding-customers" {
#   schema_registry_cluster {
#     id = data.confluent_schema_registry_cluster.cc_sr_cluster.id
#   }
#   rest_endpoint = data.confluent_schema_registry_cluster.cc_sr_cluster.rest_endpoint
#   credentials {
#    key    = confluent_api_key.app-manager-schema-api-key.id
#    secret = confluent_api_key.app-manager-schema-api-key.secret
#   }

#   tag_name = "PRIVATE"
#   entity_name = "${data.confluent_schema_registry_cluster.cc_sr_cluster.id}:${confluent_kafka_cluster.cc_kafka_cluster.id}:${confluent_kafka_topic.customers.topic_name}"
#   entity_type = "kafka_topic"

#     lifecycle {
#  prevent_destroy = false
#  }
# }

# resource "confluent_tag_binding" "PII-binding-customers" {
#   schema_registry_cluster {
#     id = data.confluent_schema_registry_cluster.cc_sr_cluster.id
#   }
#   rest_endpoint = data.confluent_schema_registry_cluster.cc_sr_cluster.rest_endpoint
#   credentials {
#    key    = confluent_api_key.app-manager-schema-api-key.id
#    secret = confluent_api_key.app-manager-schema-api-key.secret
#   }

#   tag_name = "PII_01"
#   entity_name = "${data.confluent_schema_registry_cluster.cc_sr_cluster.id}:${confluent_kafka_cluster.cc_kafka_cluster.id}:${confluent_kafka_topic.customers.topic_name}"
#   entity_type = "kafka_topic"

#     lifecycle {
#  prevent_destroy = false
#  }
# }


# resource "confluent_tag_binding" "Public-binding-users" {
#   schema_registry_cluster {
#     id = data.confluent_schema_registry_cluster.cc_sr_cluster.id
#   }
#   rest_endpoint = data.confluent_schema_registry_cluster.cc_sr_cluster.rest_endpoint
#   credentials {
#    key    = confluent_api_key.app-manager-schema-api-key.id
#    secret = confluent_api_key.app-manager-schema-api-key.secret
#   }

#   tag_name = "PUBLIC"
#   entity_name = "${data.confluent_schema_registry_cluster.cc_sr_cluster.id}:${confluent_kafka_cluster.cc_kafka_cluster.id}:${confluent_kafka_topic.users.topic_name}"
#   entity_type = "kafka_topic"

#     lifecycle {
#  prevent_destroy = false
#  }
# }

# resource "confluent_tag_binding" "Private-binding-customers_table" {
#   schema_registry_cluster {
#     id = data.confluent_schema_registry_cluster.cc_sr_cluster.id
#   }
#   rest_endpoint = data.confluent_schema_registry_cluster.cc_sr_cluster.rest_endpoint
#   credentials {
#    key    = confluent_api_key.app-manager-schema-api-key.id
#    secret = confluent_api_key.app-manager-schema-api-key.secret
#   }

#   tag_name = "PRIVATE"
#   entity_name = "${data.confluent_schema_registry_cluster.cc_sr_cluster.id}:${confluent_kafka_cluster.cc_kafka_cluster.id}:customers_table"
#   entity_type = "kafka_topic"

#     lifecycle {
#  prevent_destroy = false
#  }
# }

# resource "confluent_tag_binding" "PII-binding-customers-table" {
#   schema_registry_cluster {
#     id = data.confluent_schema_registry_cluster.cc_sr_cluster.id
#   }
#   rest_endpoint = data.confluent_schema_registry_cluster.cc_sr_cluster.rest_endpoint
#   credentials {
#    key    = confluent_api_key.app-manager-schema-api-key.id
#    secret = confluent_api_key.app-manager-schema-api-key.secret
#   }

#   tag_name = "PII_01"
#   entity_name = "${data.confluent_schema_registry_cluster.cc_sr_cluster.id}:${confluent_kafka_cluster.cc_kafka_cluster.id}:customers_table"
#   entity_type = "kafka_topic"

#     lifecycle {
#  prevent_destroy = false
#  }
# }

# resource "confluent_tag_binding" "Financial-binding-transactions_enriched" {
#   schema_registry_cluster {
#     id = data.confluent_schema_registry_cluster.cc_sr_cluster.id
#   }
#   rest_endpoint = data.confluent_schema_registry_cluster.cc_sr_cluster.rest_endpoint
#   credentials {
#    key    = confluent_api_key.app-manager-schema-api-key.id
#    secret = confluent_api_key.app-manager-schema-api-key.secret
#   }

#   tag_name = "FINANCIAL"
#   entity_name = "${data.confluent_schema_registry_cluster.cc_sr_cluster.id}:${confluent_kafka_cluster.cc_kafka_cluster.id}:transactions_enriched"
#   entity_type = "kafka_topic"

#     lifecycle {
#  prevent_destroy = false
#  }
# }


# resource "confluent_tag_binding" "Transaction-binding-transactions_enriched" {
#   schema_registry_cluster {
#     id = data.confluent_schema_registry_cluster.cc_sr_cluster.id
#   }
#   rest_endpoint = data.confluent_schema_registry_cluster.cc_sr_cluster.rest_endpoint
#   credentials {
#    key    = confluent_api_key.app-manager-schema-api-key.id
#    secret = confluent_api_key.app-manager-schema-api-key.secret
#   }

#   tag_name = "TRANSACTION"
#   entity_name = "${data.confluent_schema_registry_cluster.cc_sr_cluster.id}:${confluent_kafka_cluster.cc_kafka_cluster.id}:transactions_enriched"
#   entity_type = "kafka_topic"

#     lifecycle {
#  prevent_destroy = false
#  }
# }

# resource "confluent_tag_binding" "PII-binding-transactions_enriched" {
#   schema_registry_cluster {
#     id = data.confluent_schema_registry_cluster.cc_sr_cluster.id
#   }
#   rest_endpoint = data.confluent_schema_registry_cluster.cc_sr_cluster.rest_endpoint
#   credentials {
#    key    = confluent_api_key.app-manager-schema-api-key.id
#    secret = confluent_api_key.app-manager-schema-api-key.secret
#   }

#   tag_name = "PII_01"
#   entity_name = "${data.confluent_schema_registry_cluster.cc_sr_cluster.id}:${confluent_kafka_cluster.cc_kafka_cluster.id}:transactions_enriched"
#   entity_type = "kafka_topic"

#     lifecycle {
#  prevent_destroy = false
#  }
# }


# resource "confluent_tag_binding" "Fraudulent-binding-fd_possible_fraud" {
#   schema_registry_cluster {
#     id = data.confluent_schema_registry_cluster.cc_sr_cluster.id
#   }
#   rest_endpoint = data.confluent_schema_registry_cluster.cc_sr_cluster.rest_endpoint
#   credentials {
#    key    = confluent_api_key.app-manager-schema-api-key.id
#    secret = confluent_api_key.app-manager-schema-api-key.secret
#   }

#   tag_name = "FRAUDULENT"
#   entity_name = "${data.confluent_schema_registry_cluster.cc_sr_cluster.id}:${confluent_kafka_cluster.cc_kafka_cluster.id}:fd_possible_fraud"
#   entity_type = "kafka_topic"

#     lifecycle {
#  prevent_destroy = false
#  }
# }

# resource "confluent_tag_binding" "Sensitive-binding-fd_possible_fraud" {
#   schema_registry_cluster {
#     id = data.confluent_schema_registry_cluster.cc_sr_cluster.id
#   }
#   rest_endpoint = data.confluent_schema_registry_cluster.cc_sr_cluster.rest_endpoint
#   credentials {
#    key    = confluent_api_key.app-manager-schema-api-key.id
#    secret = confluent_api_key.app-manager-schema-api-key.secret
#   }

#   tag_name = "SENSITIVE"
#   entity_name = "${data.confluent_schema_registry_cluster.cc_sr_cluster.id}:${confluent_kafka_cluster.cc_kafka_cluster.id}:fd_possible_fraud"
#   entity_type = "kafka_topic"

#     lifecycle {
#  prevent_destroy = false
#  }
# }


# resource "confluent_tag_binding" "PII-binding-fd_possible_fraud" {
#   schema_registry_cluster {
#     id = data.confluent_schema_registry_cluster.cc_sr_cluster.id
#   }
#   rest_endpoint = data.confluent_schema_registry_cluster.cc_sr_cluster.rest_endpoint
#   credentials {
#    key    = confluent_api_key.app-manager-schema-api-key.id
#    secret = confluent_api_key.app-manager-schema-api-key.secret
#   }

#   tag_name = "PII_01"
#   entity_name = "${data.confluent_schema_registry_cluster.cc_sr_cluster.id}:${confluent_kafka_cluster.cc_kafka_cluster.id}:fd_possible_fraud"
#   entity_type = "kafka_topic"

#     lifecycle {
#  prevent_destroy = false
#  }
# }

# resource "confluent_business_metadata" "DataSource" {
#    schema_registry_cluster {
#     id = data.confluent_schema_registry_cluster.cc_sr_cluster.id
#   }
#   rest_endpoint = data.confluent_schema_registry_cluster.cc_sr_cluster.rest_endpoint
#   credentials {
#    key    = confluent_api_key.app-manager-schema-api-key.id
#    secret = confluent_api_key.app-manager-schema-api-key.secret
#   }


#   name = "Data Source"
#   description = "Source From where the Data is arriving"
#   attribute_definition {
#     name = "value"
#   }

#     lifecycle {
#  prevent_destroy = false
#  }
# }

# resource "confluent_business_metadata_binding" "DataSource-binding-customers" {
#   schema_registry_cluster {
#     id = data.confluent_schema_registry_cluster.cc_sr_cluster.id
#   }
#   rest_endpoint = data.confluent_schema_registry_cluster.cc_sr_cluster.rest_endpoint
#   credentials {
#    key    = confluent_api_key.app-manager-schema-api-key.id
#    secret = confluent_api_key.app-manager-schema-api-key.secret
#   }

#   business_metadata_name = confluent_business_metadata.DataSource.name
#   entity_name = "${data.confluent_schema_registry_cluster.cc_sr_cluster.id}:${confluent_kafka_cluster.cc_kafka_cluster.id}:${confluent_kafka_topic.customers.topic_name}"
#   entity_type = "kafka_topic"
#   attributes = {
#     "value"="Datagen"
#   }

#     lifecycle {
#  prevent_destroy = false
#  }
# }


# resource "confluent_business_metadata_binding" "DataSource-binding-transactions" {
#   schema_registry_cluster {
#     id = data.confluent_schema_registry_cluster.cc_sr_cluster.id
#   }
#   rest_endpoint = data.confluent_schema_registry_cluster.cc_sr_cluster.rest_endpoint
#   credentials {
#    key    = confluent_api_key.app-manager-schema-api-key.id
#    secret = confluent_api_key.app-manager-schema-api-key.secret
#   }

#   business_metadata_name = confluent_business_metadata.DataSource.name
#   entity_name = "${data.confluent_schema_registry_cluster.cc_sr_cluster.id}:${confluent_kafka_cluster.cc_kafka_cluster.id}:${confluent_kafka_topic.credit_card_transactions.topic_name}"
#   entity_type = "kafka_topic"
#   attributes = {
#     "value"="Datagen"
#   }

#     lifecycle {
#  prevent_destroy = false
#  }
# }

# resource "confluent_business_metadata" "DataSink" {
#    schema_registry_cluster {
#     id = data.confluent_schema_registry_cluster.cc_sr_cluster.id
#   }
#   rest_endpoint = data.confluent_schema_registry_cluster.cc_sr_cluster.rest_endpoint
#   credentials {
#    key    = confluent_api_key.app-manager-schema-api-key.id
#    secret = confluent_api_key.app-manager-schema-api-key.secret
#   }


#   name = "Data Sink"
#   description = "Where is data utilized into the system"
#   attribute_definition {
#     name = "value"
#   }

#     lifecycle {
#  prevent_destroy = false
#  }
# }


# resource "confluent_business_metadata_binding" "Datasinkbinding-transactions" {
#   schema_registry_cluster {
#     id = data.confluent_schema_registry_cluster.cc_sr_cluster.id
#   }
#   rest_endpoint = data.confluent_schema_registry_cluster.cc_sr_cluster.rest_endpoint
#   credentials {
#    key    = confluent_api_key.app-manager-schema-api-key.id
#    secret = confluent_api_key.app-manager-schema-api-key.secret
#   }

#   business_metadata_name = confluent_business_metadata.DataSink.name
#   entity_name = "${data.confluent_schema_registry_cluster.cc_sr_cluster.id}:${confluent_kafka_cluster.cc_kafka_cluster.id}:fd_possible_fraud"
#   entity_type = "kafka_topic"
#   attributes = {
#     "value"="Lambda"
#   }

#     lifecycle {
#  prevent_destroy = false
#  }
# }

# resource "confluent_business_metadata" "DataAccessPermissions" {

#    schema_registry_cluster {
#     id = data.confluent_schema_registry_cluster.cc_sr_cluster.id
#   }
#   rest_endpoint = data.confluent_schema_registry_cluster.cc_sr_cluster.rest_endpoint
#   credentials {
#    key    = confluent_api_key.app-manager-schema-api-key.id
#    secret = confluent_api_key.app-manager-schema-api-key.secret
#   }


#   name = "Data Access Permissions"
#   description = "Who can access the data"
#   attribute_definition {
#     name = "description"
#   }

#     lifecycle {
#  prevent_destroy = false
#  }
# }

# resource "confluent_business_metadata_binding" "DataAccessPermissions-binding-transactions" {
#   schema_registry_cluster {
#     id = data.confluent_schema_registry_cluster.cc_sr_cluster.id
#   }
#   rest_endpoint = data.confluent_schema_registry_cluster.cc_sr_cluster.rest_endpoint
#   credentials {
#    key    = confluent_api_key.app-manager-schema-api-key.id
#    secret = confluent_api_key.app-manager-schema-api-key.secret
#   }

#   business_metadata_name = confluent_business_metadata.DataAccessPermissions.name
#   entity_name = "${data.confluent_schema_registry_cluster.cc_sr_cluster.id}:${confluent_kafka_cluster.cc_kafka_cluster.id}:${confluent_kafka_topic.credit_card_transactions.topic_name}"
#   entity_type = "kafka_topic"
#   attributes = {
#     "description"="Access Limited to finance and analytics teams."
#   }

#     lifecycle {
#  prevent_destroy = false
#  }
# }

# resource "confluent_business_metadata_binding" "DataAccessPermissions-binding-transactions_enriched" {
#   schema_registry_cluster {
#     id = data.confluent_schema_registry_cluster.cc_sr_cluster.id
#   }
#   rest_endpoint = data.confluent_schema_registry_cluster.cc_sr_cluster.rest_endpoint
#   credentials {
#    key    = confluent_api_key.app-manager-schema-api-key.id
#    secret = confluent_api_key.app-manager-schema-api-key.secret
#   }

#   business_metadata_name = confluent_business_metadata.DataAccessPermissions.name
#   entity_name = "${data.confluent_schema_registry_cluster.cc_sr_cluster.id}:${confluent_kafka_cluster.cc_kafka_cluster.id}:transactions_enriched"
#   entity_type = "kafka_topic"
#   attributes = {
#     "description"="Access Limited to finance and analytics teams."
#   }

#     lifecycle {
#  prevent_destroy = false
#  }
# }

# resource "confluent_business_metadata_binding" "DataAccessPermissions-binding-customers" {
#   schema_registry_cluster {
#     id = data.confluent_schema_registry_cluster.cc_sr_cluster.id
#   }
#   rest_endpoint = data.confluent_schema_registry_cluster.cc_sr_cluster.rest_endpoint
#   credentials {
#    key    = confluent_api_key.app-manager-schema-api-key.id
#    secret = confluent_api_key.app-manager-schema-api-key.secret
#   }

#   business_metadata_name = confluent_business_metadata.DataAccessPermissions.name
#   entity_name = "${data.confluent_schema_registry_cluster.cc_sr_cluster.id}:${confluent_kafka_cluster.cc_kafka_cluster.id}:${confluent_kafka_topic.customers.topic_name}"
#   entity_type = "kafka_topic"
#   attributes = {
#     "description"="Accessible to sales, marketing, and customer service teams."
#   }

#     lifecycle {
#  prevent_destroy = false
#  }
# }

# resource "confluent_business_metadata_binding" "DataAccessPermissions-binding-customers-table" {
#   schema_registry_cluster {
#     id = data.confluent_schema_registry_cluster.cc_sr_cluster.id
#   }
#   rest_endpoint = data.confluent_schema_registry_cluster.cc_sr_cluster.rest_endpoint
#   credentials {
#    key    = confluent_api_key.app-manager-schema-api-key.id
#    secret = confluent_api_key.app-manager-schema-api-key.secret
#   }

#   business_metadata_name = confluent_business_metadata.DataAccessPermissions.name
#   entity_name = "${data.confluent_schema_registry_cluster.cc_sr_cluster.id}:${confluent_kafka_cluster.cc_kafka_cluster.id}:customers_table"
#   entity_type = "kafka_topic"
#   attributes = {
#     "description"="Accessible to sales, marketing, and customer service teams."
#   }

#     lifecycle {
#  prevent_destroy = false
#  }
# }





# resource "confluent_business_metadata" "DeveloperTeam" {
#    schema_registry_cluster {
#     id = data.confluent_schema_registry_cluster.cc_sr_cluster.id
#   }
#   rest_endpoint = data.confluent_schema_registry_cluster.cc_sr_cluster.rest_endpoint
#   credentials {
#    key    = confluent_api_key.app-manager-schema-api-key.id
#    secret = confluent_api_key.app-manager-schema-api-key.secret
#   }


#   name = "Developer Team"
#   description = "The developement and ownership details"
#   attribute_definition {
#     name = "Team Name"
#   }
  
#   attribute_definition {
#     name = "Contact Person or SME"
#   }

# attribute_definition {
#     name = "Team DL"
#   }

#     lifecycle {
#  prevent_destroy = false
#  }
# }


# resource "confluent_business_metadata_binding" "DeveloperTeam-binding-customers-table" {
#   schema_registry_cluster {
#     id = data.confluent_schema_registry_cluster.cc_sr_cluster.id
#   }
#   rest_endpoint = data.confluent_schema_registry_cluster.cc_sr_cluster.rest_endpoint
#   credentials {
#    key    = confluent_api_key.app-manager-schema-api-key.id
#    secret = confluent_api_key.app-manager-schema-api-key.secret
#   }

#   business_metadata_name = confluent_business_metadata.DeveloperTeam.name
#   entity_name = "${data.confluent_schema_registry_cluster.cc_sr_cluster.id}:${confluent_kafka_cluster.cc_kafka_cluster.id}:customers_table"
#   entity_type = "kafka_topic"
#   attributes = {
#     "Team Name"="RiskManagement Team"
#     "Team DL"="riskmanagement@company.com"
#     "Contact Person or SME"="John Smith"
#   }

#     lifecycle {
#  prevent_destroy = false
#  }
# }

# resource "confluent_business_metadata_binding" "DeveloperTeam-binding-fd_possible_fraud" {
#   schema_registry_cluster {
#     id = data.confluent_schema_registry_cluster.cc_sr_cluster.id
#   }
#   rest_endpoint = data.confluent_schema_registry_cluster.cc_sr_cluster.rest_endpoint
#   credentials {
#    key    = confluent_api_key.app-manager-schema-api-key.id
#    secret = confluent_api_key.app-manager-schema-api-key.secret
#   }

#   business_metadata_name = confluent_business_metadata.DeveloperTeam.name
#   entity_name = "${data.confluent_schema_registry_cluster.cc_sr_cluster.id}:${confluent_kafka_cluster.cc_kafka_cluster.id}:fd_possible_fraud"
#   entity_type = "kafka_topic"
#   attributes = {
#     "Team Name"="RiskManagement Team"
#     "Team DL"="riskmanagement@company.com"
#     "Contact Person or SME"="John Smith"
#   }

#     lifecycle {
#  prevent_destroy = false
#  }
# }

# resource "confluent_business_metadata_binding" "DeveloperTeam-binding-transactions_enriched" {
#   schema_registry_cluster {
#     id = data.confluent_schema_registry_cluster.cc_sr_cluster.id
#   }
#   rest_endpoint = data.confluent_schema_registry_cluster.cc_sr_cluster.rest_endpoint
#   credentials {
#    key    = confluent_api_key.app-manager-schema-api-key.id
#    secret = confluent_api_key.app-manager-schema-api-key.secret
#   }

#   business_metadata_name = confluent_business_metadata.DeveloperTeam.name
#   entity_name = "${data.confluent_schema_registry_cluster.cc_sr_cluster.id}:${confluent_kafka_cluster.cc_kafka_cluster.id}:transactions_enriched"
#   entity_type = "kafka_topic"
#   attributes = {
#     "Team Name"="RiskManagement Team"
#     "Team DL"="riskmanagement@company.com"
#     "Contact Person or SME"="John Smith"
#   }

#     lifecycle {
#  prevent_destroy = false
#  }
# }

# resource "confluent_business_metadata_binding" "DeveloperTeam-binding-customers" {
#   schema_registry_cluster {
#     id = data.confluent_schema_registry_cluster.cc_sr_cluster.id
#   }
#   rest_endpoint = data.confluent_schema_registry_cluster.cc_sr_cluster.rest_endpoint
#   credentials {
#    key    = confluent_api_key.app-manager-schema-api-key.id
#    secret = confluent_api_key.app-manager-schema-api-key.secret
#   }

#   business_metadata_name = confluent_business_metadata.DeveloperTeam.name
#   entity_name = "${data.confluent_schema_registry_cluster.cc_sr_cluster.id}:${confluent_kafka_cluster.cc_kafka_cluster.id}:${confluent_kafka_topic.customers.topic_name}"
#   entity_type = "kafka_topic"
#   attributes = {
#     "Team Name"="CustomerExperience Team"
#     "Team DL"="customerexperience@company.com"
#     "Contact Person or SME"="Emily Johnson"
#   }

#     lifecycle {
#  prevent_destroy = false
#  }
# }

# resource "confluent_business_metadata_binding" "DeveloperTeam-binding-credit_card_transactions" {
#   schema_registry_cluster {
#     id = data.confluent_schema_registry_cluster.cc_sr_cluster.id
#   }
#   rest_endpoint = data.confluent_schema_registry_cluster.cc_sr_cluster.rest_endpoint
#   credentials {
#    key    = confluent_api_key.app-manager-schema-api-key.id
#    secret = confluent_api_key.app-manager-schema-api-key.secret
#   }

#   business_metadata_name = confluent_business_metadata.DeveloperTeam.name
#   entity_name = "${data.confluent_schema_registry_cluster.cc_sr_cluster.id}:${confluent_kafka_cluster.cc_kafka_cluster.id}:${confluent_kafka_topic.credit_card_transactions.topic_name}"
#   entity_type = "kafka_topic"
#   attributes = {
#     "Team Name"="FinanceTech Team"
#     "Team DL"="cfinancetech@company.com"
#     "Contact Person or SME"="Jennifer Garcia"
#   }

#     lifecycle {
#  prevent_destroy = false
#  }
# }



# resource "confluent_business_metadata" "DataCompliance" {
#    schema_registry_cluster {
#     id = data.confluent_schema_registry_cluster.cc_sr_cluster.id
#   }
#   rest_endpoint = data.confluent_schema_registry_cluster.cc_sr_cluster.rest_endpoint
#   credentials {
#    key    = confluent_api_key.app-manager-schema-api-key.id
#    secret = confluent_api_key.app-manager-schema-api-key.secret
#   }


#   name = "Data Compliance"
#   description = "The developement and ownership details"
#   attribute_definition {
#     name = "description"
#   }

#     lifecycle {
#  prevent_destroy = false
#  }
# }

# resource "confluent_business_metadata_binding" "DataCompliance-binding-credit_card_transactions" {
#   schema_registry_cluster {
#     id = data.confluent_schema_registry_cluster.cc_sr_cluster.id
#   }
#   rest_endpoint = data.confluent_schema_registry_cluster.cc_sr_cluster.rest_endpoint
#   credentials {
#    key    = confluent_api_key.app-manager-schema-api-key.id
#    secret = confluent_api_key.app-manager-schema-api-key.secret
#   }

#   business_metadata_name = confluent_business_metadata.DataCompliance.name
#   entity_name = "${data.confluent_schema_registry_cluster.cc_sr_cluster.id}:${confluent_kafka_cluster.cc_kafka_cluster.id}:${confluent_kafka_topic.credit_card_transactions.topic_name}"
#   entity_type = "kafka_topic"
#   attributes = {
#     "description"="PCI DSS (Payment Card Industry Data Security Standard) compliant"
#   }

#     lifecycle {
#  prevent_destroy = false
#  }
# }

# resource "confluent_business_metadata_binding" "DataCompliance_binding_transactions_enriched" {
#   schema_registry_cluster {
#     id = data.confluent_schema_registry_cluster.cc_sr_cluster.id
#   }
#   rest_endpoint = data.confluent_schema_registry_cluster.cc_sr_cluster.rest_endpoint
#   credentials {
#    key    = confluent_api_key.app-manager-schema-api-key.id
#    secret = confluent_api_key.app-manager-schema-api-key.secret
#   }

#   business_metadata_name = confluent_business_metadata.DataCompliance.name
#   entity_name = "${data.confluent_schema_registry_cluster.cc_sr_cluster.id}:${confluent_kafka_cluster.cc_kafka_cluster.id}:transactions_enriched"
#   entity_type = "kafka_topic"
#   attributes = {
#     "description"="PCI DSS and GDPR compliant"
#   }

#     lifecycle {
#  prevent_destroy = false
#  }
# }


# resource "confluent_business_metadata_binding" "DataCompliance-binding-customers" {
#   schema_registry_cluster {
#     id = data.confluent_schema_registry_cluster.cc_sr_cluster.id
#   }
#   rest_endpoint = data.confluent_schema_registry_cluster.cc_sr_cluster.rest_endpoint
#   credentials {
#    key    = confluent_api_key.app-manager-schema-api-key.id
#    secret = confluent_api_key.app-manager-schema-api-key.secret
#   }

#   business_metadata_name = confluent_business_metadata.DataCompliance.name
#   entity_name = "${data.confluent_schema_registry_cluster.cc_sr_cluster.id}:${confluent_kafka_cluster.cc_kafka_cluster.id}:${confluent_kafka_topic.customers.topic_name}"
#   entity_type = "kafka_topic"
#   attributes = {
#     "description"="GDPR (General Data Protection Regulation) compliant"
#   }

#     lifecycle {
#  prevent_destroy = false
#  }
# }


# resource "confluent_business_metadata_binding" "DataCompliance-binding-customers_table" {
#   schema_registry_cluster {
#     id = data.confluent_schema_registry_cluster.cc_sr_cluster.id
#   }
#   rest_endpoint = data.confluent_schema_registry_cluster.cc_sr_cluster.rest_endpoint
#   credentials {
#    key    = confluent_api_key.app-manager-schema-api-key.id
#    secret = confluent_api_key.app-manager-schema-api-key.secret
#   }

#   business_metadata_name = confluent_business_metadata.DataCompliance.name
#   entity_name = "${data.confluent_schema_registry_cluster.cc_sr_cluster.id}:${confluent_kafka_cluster.cc_kafka_cluster.id}:customers_table"
#   entity_type = "kafka_topic"
#   attributes = {
#     "description"="GDPR (General Data Protection Regulation) compliant"
#   }

#     lifecycle {
#  prevent_destroy = false
#  }
# }






# resource "confluent_business_metadata" "Domain" {
#    schema_registry_cluster {
#     id = data.confluent_schema_registry_cluster.cc_sr_cluster.id
#   }
#   rest_endpoint = data.confluent_schema_registry_cluster.cc_sr_cluster.rest_endpoint
#   credentials {
#    key    = confluent_api_key.app-manager-schema-api-key.id
#    secret = confluent_api_key.app-manager-schema-api-key.secret
#   }


#   name = "DomainSector"
#   description = "Sector where the data belongs to"
#   attribute_definition {
#     name = "name"
#   }

#     lifecycle {
#  prevent_destroy = false
#  }
# }

# resource "confluent_business_metadata_binding" "Domain-binding-customers-credit_card_transactions" {
#   schema_registry_cluster {
#     id = data.confluent_schema_registry_cluster.cc_sr_cluster.id
#   }
#   rest_endpoint = data.confluent_schema_registry_cluster.cc_sr_cluster.rest_endpoint
#   credentials {
#    key    = confluent_api_key.app-manager-schema-api-key.id
#    secret = confluent_api_key.app-manager-schema-api-key.secret
#   }

#   business_metadata_name = confluent_business_metadata.Domain.name
#   entity_name = "${data.confluent_schema_registry_cluster.cc_sr_cluster.id}:${confluent_kafka_cluster.cc_kafka_cluster.id}:${confluent_kafka_topic.credit_card_transactions.topic_name}"
#   entity_type = "kafka_topic"
#   attributes = {
#     "name"="Finance domain, Payment Processing domain"
#   }

#     lifecycle {
#  prevent_destroy = false
#  }
# }

# resource "confluent_business_metadata_binding" "Domain-binding-customers-transactions_enriched" {
#   schema_registry_cluster {
#     id = data.confluent_schema_registry_cluster.cc_sr_cluster.id
#   }
#   rest_endpoint = data.confluent_schema_registry_cluster.cc_sr_cluster.rest_endpoint
#   credentials {
#    key    = confluent_api_key.app-manager-schema-api-key.id
#    secret = confluent_api_key.app-manager-schema-api-key.secret
#   }

#   business_metadata_name = confluent_business_metadata.Domain.name
#   entity_name = "${data.confluent_schema_registry_cluster.cc_sr_cluster.id}:${confluent_kafka_cluster.cc_kafka_cluster.id}:transactions_enriched"
#   entity_type = "kafka_topic"
#   attributes = {
#     "name"="Finance domain, Payment Processing domain"
#   }

#     lifecycle {
#  prevent_destroy = false
#  }
# }

# resource "confluent_business_metadata_binding" "Domain-binding-customers-customers" {
#   schema_registry_cluster {
#     id = data.confluent_schema_registry_cluster.cc_sr_cluster.id
#   }
#   rest_endpoint = data.confluent_schema_registry_cluster.cc_sr_cluster.rest_endpoint
#   credentials {
#    key    = confluent_api_key.app-manager-schema-api-key.id
#    secret = confluent_api_key.app-manager-schema-api-key.secret
#   }

#   business_metadata_name = confluent_business_metadata.Domain.name
#   entity_name = "${data.confluent_schema_registry_cluster.cc_sr_cluster.id}:${confluent_kafka_cluster.cc_kafka_cluster.id}:${confluent_kafka_topic.customers.topic_name}"
#   entity_type = "kafka_topic"
#   attributes = {
#     "name"="Sales and Marketing domain, Customer Relationship Management (CRM) domain"
#   }

#     lifecycle {
#  prevent_destroy = false
#  }
# }

# resource "confluent_business_metadata_binding" "Domain_binding_customers_transactions_enriched" {
#   schema_registry_cluster {
#     id = data.confluent_schema_registry_cluster.cc_sr_cluster.id
#   }
#   rest_endpoint = data.confluent_schema_registry_cluster.cc_sr_cluster.rest_endpoint
#   credentials {
#    key    = confluent_api_key.app-manager-schema-api-key.id
#    secret = confluent_api_key.app-manager-schema-api-key.secret
#   }

#   business_metadata_name = confluent_business_metadata.Domain.name
#   entity_name = "${data.confluent_schema_registry_cluster.cc_sr_cluster.id}:${confluent_kafka_cluster.cc_kafka_cluster.id}:customers_table"
#   entity_type = "kafka_topic"
#   attributes = {
#     "name"="Sales and Marketing domain, Customer Relationship Management (CRM) domain"
#   }

#     lifecycle {
#  prevent_destroy = false
#  }
# }
resource "confluent_schema" "avro-test-data-quality" {
  schema_registry_cluster {
    id = data.confluent_schema_registry_cluster.cc_sr_cluster.id
  }
  rest_endpoint = data.confluent_schema_registry_cluster.cc_sr_cluster.rest_endpoint
  subject_name = "test-data-quality-value"
  format = "AVRO"
  schema = file("./schemas/transactions/credit_card.avsc")
  credentials {
    key    = confluent_api_key.app-manager-schema-api-key.id
    secret = confluent_api_key.app-manager-schema-api-key.secret
  }
  ruleset {
    domain_rules {
        name="checkLen"
        kind="CONDITION"
        type="CEL"
        mode="WRITE"
        expr="size(message.credit_card_last_four)==4"

    }
  }
}



