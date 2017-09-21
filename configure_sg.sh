#!/bin/bash

set -ex

# Workaround to enable 'git clone ...'
# See: https://stackoverflow.com/questions/20271926/git-error-unable-to-look-up-current-user-in-the-passwd-file-no-such-user-wh#comment52048202_20272540
git config --global user.email "you@example.com"
git config --global user.name "Your Name"

ACTUAL_DIR=`pwd`
cd ${TMP_DIR}
git clone https://github.com/floragunncom/search-guard-ssl.git -b v${SG_SSL_VER}
cd search-guard-ssl/example-pki-scripts/
./example.sh

# for the searchguard.ssl.transport.keystore
mkdir transport
# have to move these because gen_node_cert_no_oid.sh will overwrite them
for nn in 0 1 2 ; do mv node-${nn}* transport ; done
# the searchguard.ssl.http certs cannot use this oid due to bugs in python and openssl
sed 's/,oid:1.2.3.4.5.5//g' gen_node_cert.sh > gen_node_cert_no_oid.sh
chmod +x gen_node_cert_no_oid.sh
# create http certs/trusts for nodes
for nn in 0 1 2 ; do ./gen_node_cert_no_oid.sh $nn changeit capass ; done

# ...
ls -alrtF
cd ${ACTUAL_DIR}

cp ${TMP_DIR}/search-guard-ssl/example-pki-scripts/truststore.jks ${ES_CONF}/truststore.jks
cp ${TMP_DIR}/search-guard-ssl/example-pki-scripts/transport/node-0-keystore.jks ${ES_CONF}/transport-node-0-keystore.jks
cp ${TMP_DIR}/search-guard-ssl/example-pki-scripts/node-0-keystore.jks ${ES_CONF}/http-node-0-keystore.jks
