@echo off

setlocal

REM load environments from .env
for /f "usebackq tokens=1,2 delims==" %%a in (.env) do (
    set "%%a=%%b"
)

set "main_dir=%cd%"
cd %main_dir%


REM Generate docker-compose-redis-sentinel1.yml
set "TEMPLATE_COMPOSE=compose.redis-sentinel1.template.yml"
set "OUTPUT_COMPOSE=docker-compose-redis-sentinel1.yml"

REM Copy template to final file
copy /Y "%TEMPLATE_COMPOSE%" "%OUTPUT_COMPOSE%" >nul

REM Add networks section to end of file
echo. >> %OUTPUT_COMPOSE%
echo networks: >> %OUTPUT_COMPOSE%
echo   %DOCKER_NETWORK_NAME%: >> %OUTPUT_COMPOSE%
echo     external: true >> %OUTPUT_COMPOSE%

echo Creating network %DOCKER_NETWORK_NAME% if it is not exists
docker network inspect %DOCKER_NETWORK_NAME% >nul 2>&1 || docker network create %DOCKER_NETWORK_NAME%


docker-compose -f %OUTPUT_COMPOSE% up -d 

endlocal
exit /b