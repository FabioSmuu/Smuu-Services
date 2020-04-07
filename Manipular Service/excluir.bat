@echo off

set nome=NomeDoProceso

reg delete "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\services\%nome%" /f
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet002\services\%nome%" /f
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\%nome%" /f

exit /b