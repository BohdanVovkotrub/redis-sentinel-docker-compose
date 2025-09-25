# Redis-Sentinel-Docker-Compose

Based on project of feedthedev: [https://github.com/feedthedev/Redis-Sentinel-Docker-Compose](https://github.com/feedthedev/Redis-Sentinel-Docker-Compose)

For more information and an explanation of original, see: [https://blog.alexseifert.com/2020/07/13/using-redis-sentinel-with-docker-compose-2020-edition/](https://blog.alexseifert.com/2020/07/13/using-redis-sentinel-with-docker-compose-2020-edition/)

<hr>

# Requirements

Docker  
Docker-Compose

> I recommend using **Docker Desktop** because it is easier to use and contains all the necessary Docker modules, such as Compose and others.

<br>

## Configure before using

1. **Set environment variables:**  
   Copy `.env.example` to `.env` and edit values as needed, or let the script prompt you for values.

2. **Check Docker Compose template:**  
   Make sure `docker-compose-template.yml` is configured for your needs.



<br>

## `.env` file description

The `.env` file contains environment variables used to configure the MongoDB replica set and supporting services.  
You can copy `.env.example` to `.env` and adjust values as needed.

**Main variables:**

- `DOCKERHUB_IMAGE_REDIS` — Docker image for Redis (e.g., `redis:8.2.1-alpine`).
- `DOCKERHUB_IMAGE_REDIS_INSIGHT` — Docker image for RedisInsight (e.g., `redis/redisinsight:latest`).
- `REDIS_PASSWORD` — Password for Redis authentication.
- `REDIS_MASTER_HOST` — Hostname of the Redis master instance.
- `REDIS_MASTER_PORT` — Port of the Redis master instance.
- `REDIS_SLAVE_PORT` — Port for Redis slave instance.
- `REDIS_SENTINEL_NAME` — Name of the Redis Sentinel service.
- `REDIS_SENTINEL1_PORT`, `REDIS_SENTINEL2_PORT`, `REDIS_SENTINEL3_PORT` — Ports for the three Redis Sentinel instances.
- `REDIS_SENTINEL_QUORUM` — Number of Sentinels required for quorum.
- `REDIS_SENTINEL_DOWN_AFTER` — Time (in milliseconds) after which a master is considered down.
- `REDIS_SENTINEL_FAILOVER` — Time (in milliseconds) to wait before starting a failover.
- `REDIS_INSIGHT_PORT` — Port for accessing the RedisInsight web interface.


<br>

## How to use it

Firstly, go to this folder:
```
cd "<path-to-this-folder>"
```

<br>

### Windows

**To run:**

Double click on `run.cmd`  
or run in Command Line (or PowerShell):
```
run.cmd
```

**To stop and remove containers:**
```
stop.cmd
```

**To remove all MongoDB data:**
```
remove-data.cmd
```

<br>

### Linux / MacOS

**To run:**
```
./run.sh
```

**To stop and remove containers:**
```
./stop.sh
```

**To remove all MongoDB data:**
```
./remove-data.sh
```

> If you get a "Permission denied" error, make scripts executable:
```
chmod +x *.sh scripts/*.sh 
```


<br>

## RedisInsight

[RedisInsight](https://redis.com/redis-enterprise/redis-insight/) is a visual tool for managing and monitoring Redis.  
After starting the stack, you can access RedisInsight in your browser at:

```
http://localhost:<REDIS_INSIGHT_PORT>
```

By default, this is `http://localhost:5540` (or the port you set in your `.env` file).

Use RedisInsight to connect to your Redis Sentinel-managed cluster, monitor performance, and manage data visually.


<br>

## What happens when you run the scripts?

When you run the provided scripts (`run.cmd` on Windows or `run.sh` on Linux/MacOS), the following steps are performed:

1. **Environment setup:**  
   The script checks for a `.env` file. If it does not exist, it creates one from `.env.example` and prompts you to enter or confirm values for each variable.

2. **Docker network creation:**  
   It verifies if the specified Docker network exists. If not, it creates the network using the name from your `.env` file.

3. **Docker Compose file generation:**  
   The script copies the `docker-compose-template.yml` file and appends the network configuration, creating a ready-to-use Docker Compose file.

4. **Container startup:**  
   Docker Compose is executed to build and start all Redis and Sentinel containers in detached mode.

As a result, you get a running Redis master, a Redis slave, and three Redis Sentinel instances, all configured according to your

