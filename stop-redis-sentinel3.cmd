@echo off

setlocal

REM Stop and Delete containers and their volumes
echo Stopping Redis-Sentinel-2 ...
docker-compose -f docker-compose-redis-sentinel3.yml down -v

goto ask_remove_image

:ask_remove_image
  set /p answer=Remove image of sentinel-3 <redis-redis-sentinel-3:latest> (Y/N)?
  if /i "%answer:~,1%" EQU "Y" goto remove_all_data
  if /i "%answer:~,1%" EQU "N" goto eof
  echo Please type Y for Yes or N for No
  goto ask_remove_all_data

:remove_image
  echo Removing image redis-redis-sentinel-2:latest ...
  docker rmi redis-redis-sentinel-3:latest
  docker builder prune

:eof
  echo Redis-Sentinel-1 stoped
  endlocal
  exit /b