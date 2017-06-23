@echo off
setlocal
if [%1]==[] goto HELP
if [%1]==[--help] goto HELP
REM ####################################################################################################################
REM                                                                                                                    #
REM Script:   psjoin [options] files                                                                                   #
REM                                                                                                                    #
REM Purpose:  Start psjoin without calling perl and full path of script                                                #
REM                                                                                                                    #
REM Args:     See psjoin.pl documentation                                                                              #
REM                                                                                                                    #
REM Requires: perl, psjoin.pl                                                                                          #
REM                                                                                                                    #
REM Returns:  Joined PS file on stdout                                                                                 #
REM                                                                                                                    #
REM ####################################################################################################################

set script=%gnu%/pdf/ps/psjoin.pl
perl %script% %*
goto EOF

:HELP
set script=%gnu%/pdf/ps/psjoin.pl
perl %script% -h
echo.

:EOF
