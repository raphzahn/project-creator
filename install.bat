@echo off

set "var=%cd%"

if not exist C:\Users\%username%\Scripts (
    mkdir C:\Users\%username%\Scripts
) 

xcopy %var%\create.bat C:\Users\%username%\Scripts

echo Add the following Line to the Path Variable
echo C:\Users\%username%\Scripts
rundll32 sysdm.cpl,EditEnvironmentVariables

pause
exit