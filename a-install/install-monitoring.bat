@echo off

REM Logout from any active Docker sessions to avoid potential pull issues
docker logout

REM Start Docker containers with Docker Compose
docker-compose -p monitoring_project up --build -d

REM Check if Docker Compose was successful
IF %ERRORLEVEL% EQU 0 (
    echo Docker containers started successfully.
) ELSE (
    echo There was an error starting the Docker containers.
)

REM Wait for user input to close the terminal
echo Press any key to exit...
pause > nul
