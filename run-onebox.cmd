@echo off

setlocal

REM load environments from .env
for /f "usebackq tokens=1,2 delims==" %%a in (.env) do (
    set "%%a=%%b"
)

set "main_dir=%cd%"
cd %main_dir%

echo Loading Redis-Master ...
call "run-redis-master.cmd"

echo Loading Redis-Slave ...
call "run-redis-slave.cmd"

echo Loading Sentinel-1 ...
call "run-redis-sentinel1.cmd"

echo Loading Sentinel-2 ...
call "run-redis-sentinel2.cmd"

echo Loading Sentinel-3 ...
call "run-redis-sentinel2.cmd"

endlocal
exit /b