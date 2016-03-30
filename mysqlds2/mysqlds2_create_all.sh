#!/bin/bash
# mysqlds2_create_all.sh
# start in ./ds2/mysqlds2
set -e
set -x
HOST=172.18.0.10
PASS=qq
USER=root


CMD="mysql --enable-local-infile -h $HOST -u $USER -p$PASS"

echo "Used command : $CMD"

$CMD --execute='drop database if exists DS2'

cd /root/dvd_store/ds2/mysqlds2

cd build
$CMD < mysqlds2_create_db.sql
$CMD < mysqlds2_create_ind.sql
$CMD < mysqlds2_create_sp.sql
cd ../load/cust
$CMD < mysqlds2_load_cust.sql
cd ../orders
$CMD < mysqlds2_load_orders.sql
$CMD < mysqlds2_load_orderlines.sql
$CMD < mysqlds2_load_cust_hist.sql
cd ../prod
$CMD < mysqlds2_load_prod.sql
$CMD < mysqlds2_load_inv.sql
