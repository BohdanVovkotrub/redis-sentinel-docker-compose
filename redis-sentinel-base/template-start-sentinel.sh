#!/bin/sh
set -e

REDIS_DATA_DIR="/redis"

sed -i "s/REDIS_MASTER_HOST/$REDIS_MASTER_HOST/g" $REDIS_DATA_DIR/sentinel.conf
sed -i "s/REDIS_MASTER_PORT/$REDIS_MASTER_PORT/g" $REDIS_DATA_DIR/sentinel.conf 
sed -i "s/REDIS_SENTINEL_PORT/$REDIS_SENTINEL_PORT/g" $REDIS_DATA_DIR/sentinel.conf 
sed -i "s/REDIS_PASSWORD/$REDIS_PASSWORD/g" $REDIS_DATA_DIR/sentinel.conf 
sed -i "s/REDIS_SENTINEL_NAME/$REDIS_SENTINEL_NAME/g" $REDIS_DATA_DIR/sentinel.conf 
sed -i "s/REDIS_SENTINEL_QUORUM/$REDIS_SENTINEL_QUORUM/g" $REDIS_DATA_DIR/sentinel.conf
sed -i "s/REDIS_SENTINEL_DOWN_AFTER/$REDIS_SENTINEL_DOWN_AFTER/g" $REDIS_DATA_DIR/sentinel.conf
sed -i "s/REDIS_SENTINEL_FAILOVER/$REDIS_SENTINEL_FAILOVER/g" $REDIS_DATA_DIR/sentinel.conf

echo "--- LOADED CONFIG: ---"
cat $REDIS_DATA_DIR/sentinel.conf
echo "----------------------"

redis-server $REDIS_DATA_DIR/sentinel.conf --sentinel
