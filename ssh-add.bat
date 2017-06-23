@echo off
setlocal
if [%1]==[--help] goto HELP
REM ####################################################################################################################
REM                                                                                                                    #
REM Batch:    ssh-add [key]                                                                                            #
REM                                                                                                                    #
REM Purpose:  Load private RSA key                                                                                     #
REM                                                                                                                    #
REM Args:     RSA key to load (default is %home%/.ssh/id_rsa                                                           #
REM                                                                                                                    #
REM Notes:    Similar syntax to Linux, when run without arguments                                                      #
REM           Agent stays active until manually closed with the mouse (right-click, exit)                              #
REM                                                                                                                    #
REM Requires: pageant                                                                                                  #
REM                                                                                                                    #
REM Returns:  Private RSA key is loaded                                                                                #
REM                                                                                                                    #
REM ####################################################################################################################

set private=%home%/.ssh/id_rsa.ppk
if [%*] NEQ [] set private=%*

start pageant %private%
goto EOF

:HELP
echo Usage: ssh-add [key]
echo.

:EOF
