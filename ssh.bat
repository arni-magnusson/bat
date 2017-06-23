@echo off
setlocal
if [%1]==[] goto HELP
if [%1]==[--help] goto HELP
REM ####################################################################################################################
REM                                                                                                                    #
REM Batch:    ssh [-load "Konsole"] [user@]host                                                                        #
REM                                                                                                                    #
REM Purpose:  Log on to remote machine                                                                                 #
REM                                                                                                                    #
REM Args:     load is a saved session theme                                                                            #
REM           host is the machine to login on                                                                          #
REM                                                                                                                    #
REM Notes:    Similar syntax to Linux, except [-c command] is not supported                                            #
REM           X11 forwarding is enabled                                                                                #
REM           Loads the "Konsole" session theme by default                                                             #
REM                                                                                                                    #
REM Requires: putty                                                                                                    #
REM                                                                                                                    #
REM Returns:  Remote terminal is started                                                                               #
REM                                                                                                                    #
REM ####################################################################################################################

rem Pop args until [user@]host is %1
set session="Konsole"
:STARTLOOP
if [%2]==[] goto ENDLOOP
if %1==-load set session="%2"& shift & shift
goto STARTLOOP
:ENDLOOP

rem Variable %userhost% will eventually have the form user@host
set userhost=%1

rem If no user@, then prepend username@
for /F "usebackq delims=@" %%X in ('%1') do set split=%%X
if %split%==%1 set userhost=%USERNAME%@%1

putty -X -load %session% %userhost%
goto EOF

:HELP
echo Usage: ssh [-load "Konsole"] [user@]host
echo.

:EOF
