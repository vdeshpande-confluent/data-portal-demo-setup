#!/bin/bash


set -e
source ./.env
# Output JSON result with all internal variables set
CREDIT_CARD_SCHEMA=`cat ./schemas/transactions/credit_card_timestamp.avsc`
CUSTOMERS_SCHEMA=`cat ./schemas/customers/customers_timestamp.avsc`
CONFLUENT_CLOUD_API_KEY="$CONFLUENT_CLOUD_API_KEY"
CONFLUENT_CLOUD_API_SECRET="$CONFLUENT_CLOUD_API_SECRET"
CC_ENV_ID="$CC_ENV_ID"
CC_SR_ID="$CC_SR_ID"
printf '{
    "CONFLUENT_CLOUD_API_KEY": "%s",
    "CONFLUENT_CLOUD_API_SECRET": "%s",
    "CREDIT_CARD_SCHEMA": "%s",
    "CUSTOMERS_SCHEMA": "%s",
    "CC_ENV_ID":"%s",
    "CC_SR_ID":"%s"
}' "$CONFLUENT_CLOUD_API_KEY" "$CONFLUENT_CLOUD_API_SECRET" "$CREDIT_CARD_SCHEMA" "$CUSTOMERS_SCHEMA" "$CC_ENV_ID" "$CC_SR_ID"

