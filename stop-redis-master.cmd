@echo off

setlocal

set "main_dir=%cd%"
cd %main_dir%

REM Stop and Delete containers and their volumes
echo Stopping Redis-Master ...
docker-compose -f docker-compose-redis-master.yml down -v

goto ask_remove_all_data

:ask_remove_all_data
  set /p answer=Remove all redis-master data (Y/N)?
  if /i "%answer:~,1%" EQU "Y" goto remove_all_data
  if /i "%answer:~,1%" EQU "N" goto eof
  echo Please type Y for Yes or N for No
  goto ask_remove_all_data

:remove_all_data
  cd data
  echo REMOVE /data/master ...
  rmdir /s master
  cd %main_dir%
  goto eof

:eof
  echo Redis-Master stoped
  endlocal
  exit /b