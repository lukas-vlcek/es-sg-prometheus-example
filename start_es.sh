#!/bin/bash

set -ex

exec ${ES_HOME}/bin/elasticsearch -d \
	--path.conf=${ES_CONF} \
	--security.manager.enabled false

# Give ES some time to start
sleep 15

./initialize_sg.sh
