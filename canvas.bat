@echo off
setlocal
if [%1]==[] goto HELP
if [%1]==[--help] goto HELP
REM ####################################################################################################################
REM                                                                                                                    #
REM Script:   canvas -extent=WxH [-gravity=Center] file                                                                #
REM                                                                                                                    #
REM Purpose:  Enlarge image canvas                                                                                     #
REM                                                                                                                    #
REM Args:     extent is width and height in WxH format                                                                 #
REM           gravity is where to place original image (default is Center, alternatives include NorthWest)             #
REM           file is the image filename                                                                               #
REM                                                                                                                    #
REM Requires: convert                                                                                                  #
REM                                                                                                                    #
REM Returns:  Creates new image file with WxH appended to name                                                         #
REM                                                                                                                    #
REM ####################################################################################################################

rem Pop args until file=%1
set extent=NA
set gravity=Center

:STARTLOOP
if [%2]==[] goto ENDLOOP
if %1==-extent set extent=%2& shift & shift
if %1==-gravity set gravity=%2& shift & shift
goto STARTLOOP
:ENDLOOP
if %extent%==NA goto HELP

set convert=%gnu%/graphics/imagick/convert
set output="%~dpn1_%extent%%~x1"
%convert% -extent %extent% -gravity %gravity% %1 %output%
goto EOF

:HELP
echo Usage: canvas -extent=WxH [-gravity=Center] file
echo.

:EOF
