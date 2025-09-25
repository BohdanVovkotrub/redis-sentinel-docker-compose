#!/bin/sh
set -e

REDIS_DATA_DIR="/redis"

echo ">>> Checking data dir: $REDIS_DATA_DIR"
if [ ! -d "$REDIS_DATA_DIR" ]; then
  echo ">>> Directory not found, creating..."
  mkdir -p "$REDIS_DATA_DIR"
fi

cp -f /redis-sentinel-base/template-sentinel.conf $REDIS_DATA_DIR/sentinel.conf
cp -f /redis-sentinel-base/template-start-sentinel.sh $REDIS_DATA_DIR/start-sentinel.sh

OWNER="$(ls -ld $REDIS_DATA_DIR | awk '{print $3}')"
GROUP="$(ls -ld $REDIS_DATA_DIR | awk '{print $4}')"

if [ "$OWNER" = "redis" ] && [ "$GROUP" = "redis" ]; then
  echo ">>> Ownership already correct (redis:redis), skipping chown"
else
  echo ">>> Fixing ownership to redis:redis..."
  chown -R redis:redis $REDIS_DATA_DIR
fi

echo ">>> Starting Redis..."
exec sh $REDIS_DATA_DIR/start-sentinel.sh
