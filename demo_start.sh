#!/bin/bash   

# Update timestamp on credit_card AVRO schema
UTC_NOW=`date -u +%s000`
jq -c . < ./schemas/transactions/credit_card.avsc | sed 's/"/\\"/g' | sed "s/9999999999/$UTC_NOW/" > ./schemas/transactions/credit_card_timestamp.avsc
jq -c . < ./schemas/customers/customers.avsc | sed 's/"/\\"/g' | sed "s/9999999999/$UTC_NOW/" > ./schemas/customers/customers_timestamp.avsc

terraform init
terraform plan
terraform apply --auto-approve
terraform output -json
