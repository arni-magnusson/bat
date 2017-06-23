@echo off
setlocal
if [%1]==[] goto HELP
if [%1]==[--help] goto HELP
REM ####################################################################################################################
REM                                                                                                                    #
REM Script:   scp [-q] [-r] [[user@]host:]source [[user@]host:]target                                                  #
REM                                                                                                                    #
REM Purpose:  Copy file between machines                                                                               #
REM                                                                                                                    #
REM Args:     q runs quietly                                                                                           #
REM           r copies directories recursively                                                                         #
REM           source is file/directory to copy                                                                         #
REM           target is where to write file                                                                            #
REM                                                                                                                    #
REM Notes:    Similar syntax to Linux, except file attributes are preserved by default (-p)                            #
REM           If args contain substring "hafurtask", then port 4610 will be used                                       #
REM                                                                                                                    #
REM Requires: pscp                                                                                                     #
REM                                                                                                                    #
REM Returns:  File is copied between machines                                                                          #
REM                                                                                                                    #
REM ####################################################################################################################

set args=%*
set not_hafurtask=%args:hafurtask=%

if "%args%"=="%not_hafurtask%" (pscp -p %*) else (pscp -P 4610 -p %*)

goto EOF

:HELP
echo Usage: scp [-q] [-r] [[user@]host:]source [[user@]host:]target
echo.

:EOF
