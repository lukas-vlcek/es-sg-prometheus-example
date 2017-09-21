#!/bin/bash

set -ex

### Initialize Search Guard 2 plugin
cd ${ES_HOME}
plugins/search-guard-2/tools/sgadmin.sh \
  -cd ${ES_CONF}/ \
  -ks plugins/search-guard-2/sgconfig/transport-node-0-keystore.jks \
  -ts plugins/search-guard-2/sgconfig/truststore.jks \
  -nhnv
