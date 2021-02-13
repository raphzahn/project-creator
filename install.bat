@echo off

set "var=%cd%"

if not exist C:\Users\%username%\Bin (
    mkdir C:\Users\%username%\Bin
) 

xcopy %var%\create.bat C:\Users\%username%\Bin

echo Add the following Line to the Path Variable
echo C:\Users\%username%\Bin
rundll32 sysdm.cpl,EditEnvironmentVariables

pause
exit