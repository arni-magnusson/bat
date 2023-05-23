@echo off
setlocal
if [%1]==[] goto HELP
if [%1]==[--help] goto HELP
REM ############################################################################
REM                                                                            #
REM Script:   2ico [-colors=n] file                                            #
REM                                                                            #
REM Purpose:  Convert bitmap file to ICO format                                #
REM                                                                            #
REM Args:     colors is the required number of colors (2, 16, 256)             #
REM           file is file to convert                                          #
REM                                                                            #
REM Requires: png2ico, convert                                                 #
REM                                                                            #
REM Returns:  Creates ICO file with same prefix in current directory           #
REM                                                                            #
REM ############################################################################

rem Pop args until file=%1
set icoargs=
:STARTLOOP
if [%2]==[] goto ENDLOOP
if %1==-colors set icoargs=--colors %2& shift & shift
goto STARTLOOP
:ENDLOOP

set convert=%gnu%/graphics/imagick/convert
set png=%temp%\temp.png
set ico="%~dpn1.ico"

goto %~x1

:.BMP
:.GIF
:.JPG
:.PPM
:.TIF
rem %convert% %1 %png%
rem png2ico %ico% %icoargs% %png%
rem del %png%                     & goto EOF

:.PNG
png2ico %ico% %icoargs% %1    & goto EOF

:HELP
echo Usage: 2ico [-colors=n] file
echo.

:EOF
