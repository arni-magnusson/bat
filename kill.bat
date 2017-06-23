@echo off
setlocal
if [%1]==[] goto HELP
if [%1]==[--help] goto HELP
REM ####################################################################################################################
REM                                                                                                                    #
REM Script:   kill program.exe                                                                                         #
REM                                                                                                                    #
REM Purpose:  End all processes of a program                                                                           #
REM                                                                                                                    #
REM Args:     program.exe is the program whose processes should be ended                                               #
REM                                                                                                                    #
REM Requires: nircmd                                                                                                   #
REM                                                                                                                    #
REM Returns:  All processes of 'program.exe' are ended                                                                 #
REM                                                                                                                    #
REM ####################################################################################################################

nircmd killprocess %*

goto EOF

:HELP
echo Usage: kill program.exe
echo.

:EOF
