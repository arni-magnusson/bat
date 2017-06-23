@echo off
setlocal
if [%1]==[] goto HELP
if [%1]==[--help] goto HELP
REM ############################################################################
REM                                                                            #
REM Script:   hafstokkur file(s)                                               #
REM                                                                            #
REM Purpose:  Send file to Hafstokkur from Explorer                            #
REM                                                                            #
REM Args:     file is the file to send                                         #
REM                                                                            #
REM Notes:    Use with "Send To", after placing a shortcut to this script in   #
REM             %userprofile%/sendto                                           #
REM                                                                            #
REM Requires: pscp                                                             #
REM                                                                            #
REM Returns:  Sends file to Hafstokkur                                         #
REM                                                                            #
REM ############################################################################

pscp -p -r %* hafstokkur:
goto EOF

:HELP
echo Send file to hafstokkur
echo.
echo Usage: hafstokkur file
echo.

:EOF
