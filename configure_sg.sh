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
# ...
ls -alrtF
cd ${ACTUAL_DIR}
