#!/bin/bash

set -ex

sleep 15
curl localhost:9200
curl localhost:9200/_prometheus/metrics | tail -n 20
