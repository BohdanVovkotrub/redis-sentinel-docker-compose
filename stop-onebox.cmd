@echo off

setlocal

set "main_dir=%cd%"
cd %main_dir%

echo Stop Redis (one box)

call "stop-redis-sentinel1.cmd"

call "stop-redis-sentinel2.cmd"

call "stop-redis-sentinel3.cmd"

call "run-redis-master.cmd"

call "stop-redis-slave.cmd"

echo Redis (one box) stopped
endlocal
pause
exit /b