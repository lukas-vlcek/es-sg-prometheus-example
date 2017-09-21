#!/bin/bash

set -ex

# Access REST API as an kirk user who is admin
curl -sS --insecure -u kirk:kirk https://localhost:9200
curl -sS --insecure -u kirk:kirk https://localhost:9200/_prometheus/metrics | tail -n 10

# Access REST API as an prometheus user
curl -sS --insecure -u prometheus:test https://localhost:9200/_prometheus/metrics | tail -n 10
