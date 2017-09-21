#!/bin/bash

set -ex

curl --insecure https://localhost:9200
curl --insecure https://localhost:9200/_prometheus/metrics | tail -n 20
