#!/bin/bash

set -ex

# Access REST API as an 'kirk' user who is an admin
curl -sS --insecure -u kirk:kirk https://localhost:9200
curl -sS --insecure -u kirk:kirk https://localhost:9200/_prometheus/metrics | tail -n 10

# Access promtheus REST API as 'prometheus' user (is allowed)
curl -sS --insecure -u prometheus:test https://localhost:9200/_prometheus/metrics | tail -n 10

# Access prometheus REST API as 'foo' user (is not allowed)
curl -sS --insecure -u foo:test https://localhost:9200/_prometheus/metrics | tail -n 10
