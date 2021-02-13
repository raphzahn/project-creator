@echo off

set "var=%cd%"

if not exist C:\Users\%username%\Bin (
    mkdir C:\Users\%username%\Bin
) 

xcopy %var%\create.bat C:\Users\%username%\Bin

set Path=%Path%;C:\Users\%username%\Bin

pause
exit