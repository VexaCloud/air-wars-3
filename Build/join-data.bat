@echo off
cd /d "%~dp0"
if exist AirWars3-158.data.unityweb (
  echo Already exists: AirWars3-158.data.unityweb
  dir AirWars3-158.data.unityweb
  exit /b 0
)
echo Joining parts...
copy /b AirWars3-158.data.unityweb.part00+AirWars3-158.data.unityweb.part01+AirWars3-158.data.unityweb.part02 AirWars3-158.data.unityweb
dir AirWars3-158.data.unityweb
echo Done.
