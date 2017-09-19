#!/bin/bash

exec ${ES_HOME}/bin/elasticsearch \
	--path.conf=${ES_CONF} \
	--security.manager.enabled false
