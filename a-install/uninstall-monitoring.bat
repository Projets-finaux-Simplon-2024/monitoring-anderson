@echo off

REM Stop and remove Docker containers, networks, images, and volumes
docker-compose -p monitoring_project down --rmi all -v

REM End of script
