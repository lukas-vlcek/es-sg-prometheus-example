#!/bin/bash

set -ex

echo Access REST API as an 'admin'
curl -sS --insecure -u admin:admin https://localhost:9200/_cat/indices
curl -sS --insecure -u admin:admin 'https://localhost:9200/searchguard/_search?pretty'
curl -sS --insecure -u admin:admin https://localhost:9200/_prometheus/metrics | tail -n 5
echo

echo Access REST API as 'prometheus' user
curl -sS --insecure -u prometheus:test https://localhost:9200/_cluster/health
curl -sS --insecure -u prometheus:test https://localhost:9200/_prometheus/metrics | tail -n 5
echo

echo Access REST API as 'foo' user
curl -sS --insecure -u foo:test https://localhost:9200/_cluster/health
curl -sS --insecure -u foo:test https://localhost:9200/_prometheus/metrics | tail -n 5
echo

echo Access REST API as 'test' user
curl -sS --insecure -u test:test https://localhost:9200/_cluster/health
curl -sS --insecure -u test:test https://localhost:9200/_prometheus/metrics | tail -n 5
echo

echo Access REST API as 'john' user (non existing user)
curl -sS --insecure -u john:doe https://localhost:9200/_cluster/health
curl -sS --insecure -u john:doe https://localhost:9200/_prometheus/metrics | tail -n 5
echo
