@echo off
FOR /F "TOKENS=1* DELIMS= " %%A IN ('DATE/T') DO SET CDATE=%%B
FOR /F "TOKENS=1,2 eol=/ DELIMS=/ " %%A IN ('DATE/T') DO SET mm=%%B
FOR /F "TOKENS=1,2 DELIMS=/ eol=/" %%A IN ('echo %CDATE%') DO SET dd=%%B
FOR /F "TOKENS=2,3 DELIMS=/ " %%A IN ('echo %CDATE%') DO SET yyyy=%%B
SET date=%dd%/%mm%/%yyyy%
TIME /T
echo %COMPUTERNAME%

echo.
echo Push and Pull to Github
echo 1: Push to Master
echo 0: Pull from Master
echo.

SET /P input="Enter your choice: "

IF "%input%"=="1" (
  echo Pushing updates to GitHub...
  git add .
  git commit -m "Updated on %date%"
  git push origin master
  cd ..
) ELSE IF "%input%"=="0" (
  echo Pulling latest updates from GitHub...
  git pull origin master
  cd ..
) ELSE (
  echo You Pressed Wrong Keyword. GoodBye!!!!!
)
PAUSE
