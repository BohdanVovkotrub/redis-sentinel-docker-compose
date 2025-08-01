#!/bin/sh

sed -i "s/REDIS_MASTER_HOST/$MASTER_HOST/g" /redis/sentinel.conf
sed -i "s/REDIS_MASTER_PORT/$MASTER_PORT/g" /redis/sentinel.conf 
sed -i "s/REDIS_SENTINEL_PORT/$SENTINEL_PORT/g" /redis/sentinel.conf 
sed -i "s/REDIS_PASSWORD/$PASSWORD/g" /redis/sentinel.conf 
sed -i "s/REDIS_SENTINEL_NAME/$SENTINEL_NAME/g" /redis/sentinel.conf 
sed -i "s/REDIS_SENTINEL_QUORUM/$SENTINEL_QUORUM/g" /redis/sentinel.conf
sed -i "s/REDIS_SENTINEL_DOWN_AFTER/$SENTINEL_DOWN_AFTER/g" /redis/sentinel.conf
sed -i "s/REDIS_SENTINEL_FAILOVER/$SENTINEL_FAILOVER/g" /redis/sentinel.conf

redis-server /redis/sentinel.conf --sentinel
