@echo off
setlocal
if [%1]==[] goto HELP
if [%1]==[--help] goto HELP
REM ####################################################################################################################
REM                                                                                                                    #
REM Script:   psmerge [options] files                                                                                  #
REM                                                                                                                    #
REM Purpose:  Start psmerge without calling perl and full path of script                                               #
REM                                                                                                                    #
REM Args:     See psmerge.pl documentation                                                                             #
REM                                                                                                                    #
REM Requires: perl, psmerge.pl                                                                                         #
REM                                                                                                                    #
REM Returns:  Merged PS file on stdout                                                                                 #
REM                                                                                                                    #
REM ####################################################################################################################

set script=%gnu%/pdf/ps/psmerge.pl
perl %script% %*
goto EOF

:HELP
set script=%gnu%/pdf/ps/psmerge.pl
perl %script% --help
echo.

:EOF
