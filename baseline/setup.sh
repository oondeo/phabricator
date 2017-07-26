#!/bin/bash

set -e
set -x

# Set up the Phabricator code base
mkdir /srv/phabricator
cd /srv/phabricator
git clone --depth=1 https://github.com/phacility/libphutil.git /srv/phabricator/libphutil
git clone --depth=1 https://github.com/phacility/arcanist.git /srv/phabricator/arcanist
git clone --depth=1 https://github.com/phacility/phabricator.git /srv/phabricator/phabricator
git clone --depth=1 https://github.com/PHPOffice/PHPExcel.git /srv/phabricator/PHPExcel
cd /
chown -R git:wwwgrp-phabricator /srv/phabricator
# Clone Let's Encrypt
git clone https://github.com/letsencrypt/letsencrypt /srv/letsencrypt
cd /srv/letsencrypt
./letsencrypt-auto-source/letsencrypt-auto --help
cd /
