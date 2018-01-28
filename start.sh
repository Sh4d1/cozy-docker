#!/bin/bash

cozy-stack serve -c cozy.yml >> /var/log/cozy.log 2>> /var/log/cozy.err.log --allow-root &
sleep 5
cozy-stack instances add --host 0.0.0.0 --apps drive,photos,collect,settings --passphrase "fff" cozy.ptrk.io
