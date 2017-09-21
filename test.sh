#!/bin/bash

set -ex

# Give Elasticsearch some time to start up
sleep 15
tail ${ES_HOME}/logs/elasticsearch.log

curl --insecure https://localhost:9200
curl --insecure https://localhost:9200/_prometheus/metrics | tail -n 20
