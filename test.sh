#!/bin/bash

set -ex

curl -sS --insecure -u kirk:kirk https://localhost:9200
curl -sS --insecure -u kirk:kirk https://localhost:9200/_prometheus/metrics | tail -n 20
