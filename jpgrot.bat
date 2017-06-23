@echo off
setlocal
if [%1]==[] goto HELP
if [%1]==[--help] goto HELP
REM ############################################################################
REM                                                                            #
REM Script:   jpgrot [-d deg] [-l] [-r] file                                   #
REM                                                                            #
REM Purpose:  Rotate jpeg file                                                 #
REM                                                                            #
REM Args:     deg is the number of degrees to rotate                           #
REM           l rotates left, 270 degrees                                      #
REM           r rotates right, 90 degrees                                      #
REM                                                                            #
REM Notes:    Writes backup rot.jpg in %temp%                                  #
REM                                                                            #
REM Requires: jpegtran, touch                                                  #
REM                                                                            #
REM Returns:  Rotates and overwrites jpeg file                                 #
REM                                                                            #
REM ############################################################################

rem Pop args until file=%1
set deg=0
:STARTLOOP
if [%2]==[] goto ENDLOOP
if %1==-d set deg=%2 &  shift & shift
if %1==-l set deg=270 & shift
if %1==-r set deg=90 &  shift
goto STARTLOOP
:ENDLOOP

if %deg%==0 goto EOF

set tempfile=%temp%\rot.jpg

jpegtran -rotate %deg% %1>%tempfile%
touch -r %1 %tempfile%
move %tempfile% %1

goto EOF

:HELP
echo Usage: jpgrot [-d deg] [-l] [-r] file
echo.

:EOF
