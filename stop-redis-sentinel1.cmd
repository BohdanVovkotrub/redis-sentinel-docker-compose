@echo off

setlocal

REM Stop and Delete containers and their volumes
echo Stopping Redis-Sentinel-1 ...
docker-compose -f docker-compose-redis-sentinel1.yml down -v

goto ask_remove_image

:ask_remove_image
  set /p answer=Remove image of sentinel-1 <redis-redis-sentinel-1:latest> (Y/N)?
  if /i "%answer:~,1%" EQU "Y" goto remove_all_data
  if /i "%answer:~,1%" EQU "N" goto eof
  echo Please type Y for Yes or N for No
  goto ask_remove_all_data

:remove_image
  echo Removing image redis-redis-sentinel-1:latest ...
  docker rmi redis-redis-sentinel-1:latest
  docker builder prune

:eof
  echo Redis-Sentinel-1 stoped
  endlocal
  exit /b