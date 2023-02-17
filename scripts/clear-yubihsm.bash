#!/bin/bash

yubihsm-shell >out.txt <<EOF
connect
session open 1 password
list objects 0
EOF

ids=$(awk '/id/ { print substr($2, 1, length($2)-1) }' out.txt) 
for id in $ids; do printf "connect\nsession open 1 password\ndelete 0 %s asymmetric-key" $id | yubihsm-shell; done
