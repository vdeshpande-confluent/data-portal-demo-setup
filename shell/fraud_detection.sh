#!/bin/bash
source ./demo_vars
echo 0 > $STATUS



curl --http1.1 \
    -X "POST" "https://pksqlc-81qknq.us-east-1.aws.confluent.cloud/ksql" \
    -H "Accept: application/vnd.ksql.v1+json" \
    -H "Content-Type: application/json" \
    --basic --user "IWZNKOOI22ZMBAYD:7vWoFViRnQSe2QK78XdhKnWSSQ95dhsajL3vNVN+nUU+/EMnzvgL20EgatC8iuKu" \
    -d $'{
    "ksql": "CREATE STREAM FD_TRANSACTIONS_STREAM WITH ( kafka_topic = '\''credit_card_transactions'\'' , value_format = '\''avro'\'' );",
    "streamsProperties": {}
    }'


curl --http1.1 \
    -X "POST" "https://pksqlc-81qknq.us-east-1.aws.confluent.cloud/ksql" \
    -H "Accept: application/vnd.ksql.v1+json" \
    -H "Content-Type: application/json" \
    --basic --user "IWZNKOOI22ZMBAYD:7vWoFViRnQSe2QK78XdhKnWSSQ95dhsajL3vNVN+nUU+/EMnzvgL20EgatC8iuKu" \
    -d $'{
    "ksql": "CREATE STREAM FD_CUST_RAW_STREAM WITH ( kafka_topic = '\''customers'\'' , value_format = '\''avro'\'' );",
    "streamsProperties": {}
    }'


curl --http1.1 \
    -X "POST" "https://pksqlc-81qknq.us-east-1.aws.confluent.cloud/ksql" \
    -H "Accept: application/vnd.ksql.v1+json" \
    -H "Content-Type: application/json" \
    --basic --user "IWZNKOOI22ZMBAYD:7vWoFViRnQSe2QK78XdhKnWSSQ95dhsajL3vNVN+nUU+/EMnzvgL20EgatC8iuKu" \
    -d $'{
    "ksql": "CREATE TABLE FD_CUSTOMERS_TABLE WITH ( KAFKA_TOPIC='\''customers_table'\'', PARTITIONS=6, REPLICAS=3) AS SELECT FD_CUST_RAW_STREAM.userid userid, LATEST_BY_OFFSET(FD_CUST_RAW_STREAM.fullname) fullname, LATEST_BY_OFFSET(FD_CUST_RAW_STREAM.gender) gender, LATEST_BY_OFFSET(FD_CUST_RAW_STREAM.regionid) regionid,LATEST_BY_OFFSET(FD_CUST_RAW_STREAM.avg_credit_spend) avg_credit_spend FROM FD_CUST_RAW_STREAM FD_CUST_RAW_STREAM GROUP BY FD_CUST_RAW_STREAM.userid EMIT CHANGES;",
    "streamsProperties": {}
    }'



curl --http1.1 \
    -X "POST" "https://pksqlc-81qknq.us-east-1.aws.confluent.cloud/ksql" \
    -H "Accept: application/vnd.ksql.v1+json" \
    -H "Content-Type: application/json" \
    --basic --user "IWZNKOOI22ZMBAYD:7vWoFViRnQSe2QK78XdhKnWSSQ95dhsajL3vNVN+nUU+/EMnzvgL20EgatC8iuKu" \
    -d $'{
    "ksql":"CREATE STREAM FD_TRANSACTIONS_ENRICHED WITH (KAFKA_TOPIC='\''transactions_enriched'\'', PARTITIONS=6, REPLICAS=3) AS SELECT T.userid as userid, T.timestamp as timestamp, T.amount as amount, T.transaction_id as transaction_id, T.credit_card_last_four as credit_card_last_four,C.fullname as fullname, C.regionid as regionid, C.gender as gender, C.avg_credit_spend as avg_credit_spend FROM FD_TRANSACTIONS_STREAM T INNER JOIN FD_CUSTOMERS_TABLE C ON ((C.userid = T.userid)) EMIT CHANGES;" ,
    "streamsProperties": {}
    }'


curl --http1.1 \
    -X "POST" "https://pksqlc-81qknq.us-east-1.aws.confluent.cloud/ksql" \
    -H "Accept: application/vnd.ksql.v1+json" \
    -H "Content-Type: application/json" \
    --basic --user "IWZNKOOI22ZMBAYD:7vWoFViRnQSe2QK78XdhKnWSSQ95dhsajL3vNVN+nUU+/EMnzvgL20EgatC8iuKu" \
    -d $'{
    "ksql":"CREATE TABLE FD_POSSIBLE_FRAUD WITH (KAFKA_TOPIC = '\''fd_possible_fraud'\'', KEY_FORMAT = '\''JSON'\'') AS SELECT TIMESTAMPTOSTRING(WINDOWSTART, '\''yyyy-MM-dd HH:mm:ss Z'\'') AS WINDOW_START, userid, gender, SUM(AMOUNT) AS TOTAL_CREDIT_SPEND, fullname, MAX(AVG_CREDIT_SPEND) AS AVG_CREDIT_SPEND FROM FD_TRANSACTIONS_ENRICHED WINDOW TUMBLING (SIZE 2 MINUTES) GROUP BY userid, gender, fullname HAVING SUM(AMOUNT) > MAX(AVG_CREDIT_SPEND);",
    "streamsProperties": {}
    }'



