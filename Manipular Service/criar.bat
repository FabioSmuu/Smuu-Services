@echo off

::variaveis
set nome=NomeDoProceso
::set programa=C:\Users\Smuu\Desktop\Service\service.bat
::set programa=%%temp%%\service.bat
set programa=%~dp0\service.cmd
set desc=Project2 Project2

::criar os registros de service
HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\services\%nome%
call:registrar "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\services\%nome%" "%nome%" "%desc%" "%programa%"
call:registrar "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet002\services\%nome%" "%nome%" "%desc%" "%programa%"
call:registrar "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\%nome%" "%nome%" "%desc%" "%programa%"

exit /b

:registrar
reg add %1 /v "Type" /t REG_DWORD /d 16 /f
reg add %1 /v "Start" /t REG_DWORD /d 2 /f
reg add %1 /v "ErrorControl" /t REG_DWORD /d 1 /f
reg add %1 /v "ImagePath" /t REG_EXPAND_SZ /d %4 /f
reg add %1 /v "DisplayName" /t REG_SZ /d %2 /f
reg add %1 /v "ObjectName" /t REG_SZ /d "LocalSystem" /f
reg add %1 /v "Description" /t REG_SZ /d %3 /f
