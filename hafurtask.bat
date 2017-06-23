@echo off
setlocal
if [%1]==[] goto HELP
if [%1]==[--help] goto HELP
REM ####################################################################################################################
REM                                                                                                                    #
REM Script:   hafurtask file(s)                                                                                        #
REM                                                                                                                    #
REM Purpose:  Send file to Hafurtask from Explorer                                                                     #
REM                                                                                                                    #
REM Args:     file is the file to send                                                                                 #
REM                                                                                                                    #
REM Notes:    Use with "Send To", after placing a shortcut to this script in %userprofile%/sendto                      #
REM                                                                                                                    #
REM Requires: pscp                                                                                                     #
REM                                                                                                                    #
REM Returns:  Sends file to Hafurtask                                                                                  #
REM                                                                                                                    #
REM ####################################################################################################################

pscp -P 4610 -p -r %* hafurtask.hafro.is:
goto EOF

:HELP
echo Send file to hafurtask
echo.
echo Usage: hafurtask file
echo.

:EOF
