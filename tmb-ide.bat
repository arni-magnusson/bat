@echo off

ver | find "5.1" > nul
if %ERRORLEVEL% == 0 goto WINDOWS_XP

ver | find "6.1" > nul
if %ERRORLEVEL% == 0 goto WINDOWS_7

goto EOF

:WINDOWS_XP

call tmb-ide-xp
goto EOF

:WINDOWS_7

call tmb-ide-7
goto EOF

:EOF
