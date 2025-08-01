@echo off

REM Stop and Delete containers and their volumes
docker-compose -f docker-compose-redis.yml down -v

docker rmi redis:7-alpine
docker rmi redis-redis-sentinel-1:latest
docker rmi redis-redis-sentinel-2:latest
docker rmi redis-redis-sentinel-3:latest

docker builder prune