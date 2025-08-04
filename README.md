# Redis-Sentinel-Docker-Compose

Based on project of feedthedev: [https://github.com/feedthedev/Redis-Sentinel-Docker-Compose](https://github.com/feedthedev/Redis-Sentinel-Docker-Compose)

For more information and an explanation of original, see: [https://blog.alexseifert.com/2020/07/13/using-redis-sentinel-with-docker-compose-2020-edition/](https://blog.alexseifert.com/2020/07/13/using-redis-sentinel-with-docker-compose-2020-edition/)


## To run it on Windows use:

If you are using all containers on one machine (one box) you can use script `run-onebox.cmd` or run each container separately in the following order:

1) `run-redis-master.cmd`
2) `run-redis-slave.cmd`
3) `run-redis-sentinel1.cmd`
4) `run-redis-sentinel2.cmd`
5) `run-redis-sentinel3.cmd`

If You are using each containers on different machines use the scripts separately on each machines in the same order.

## To stop it on Windows use:

As simply. do stopping according to running!

If you are using all containers on one machine (one box) you can use script `stop-onebox.cmd` or stop each container separately in the following order:

1) `stop-redis-master.cmd`
2) `stop-redis-slave.cmd`
3) `stop-redis-sentinel1.cmd`
4) `stop-redis-sentinel2.cmd`
5) `stop-redis-sentinel3.cmd`

If You are using each containers on different machines use the scripts separately on each machines in the same order.