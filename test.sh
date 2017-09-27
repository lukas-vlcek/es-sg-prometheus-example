#!/bin/bash

set -ex

echo Access REST API as 'prometheus' user
#curl -sS --insecure -u prometheus:test https://localhost:9200/_prometheus/metrics | tail -n 5
#curl -sS --insecure -u prometheus:test https://localhost:9200/_cluster/health
#curl -sS --insecure -u prometheus:test https://localhost:9200/_nodes/stats | tail -n 1 | sed -E "s/(.{200}).*$/\1/"
echo

echo Access REST API as 'foo' user
curl -sS --insecure -u foo:test https://localhost:9200/_prometheus/metrics | tail -n 5
#curl -sS --insecure -u foo:test https://localhost:9200/_cluster/health
#curl -sS --insecure -u foo:test https://localhost:9200/_nodes/stats | tail -n 1 | sed -E "s/(.{200}).*$/\1/"
echo

echo Access REST API as 'test' user
curl -sS --insecure -u test:test https://localhost:9200/_prometheus/metrics | tail -n 5
#curl -sS --insecure -u test:test https://localhost:9200/_cluster/health
#curl -sS --insecure -u test:test https://localhost:9200/_nodes/stats | tail -n 1 | sed -E "s/(.{200}).*$/\1/"
echo
