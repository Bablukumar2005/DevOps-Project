@echo off
echo ======================================
echo   Smart Insurance Management System
echo ======================================
echo.

REM ===============================
REM Start ML Service (FastAPI)
REM ===============================
echo Starting ML Service...
start cmd /k "cd /d C:\Users\ASUS\my-webapp\ml_service && uvicorn api:app --port 8000"

REM Wait a bit for ML service
timeout /t 5 > nul

REM ===============================
REM Start Spring Boot Backend
REM ===============================
echo Starting Spring Boot Backend...
start cmd /k "cd /d C:\Users\ASUS\my-webapp && mvn spring-boot:run"

REM Wait and open browser
timeout /t 10 > nul
start http://localhost:8080

echo.
echo ======================================
echo   Application is starting...
echo ======================================
echo Do NOT close the opened command windows.
echo.

pause


