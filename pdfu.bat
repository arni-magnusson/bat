@echo off
setlocal
if [%1]==[] goto HELP
if [%1]==[--help] goto HELP
REM ############################################################################
REM                                                                            #
REM Script:   pdfu file                                                        #
REM                                                                            #
REM Purpose:  Uncompress PDF document                                          #
REM                                                                            #
REM Args:     file is file to uncompress                                       #
REM                                                                            #
REM Requires: qpdf                                                             #
REM                                                                            #
REM Returns:  Creates filename_u.pdf in same directory                         #
REM                                                                            #
REM ############################################################################

set pdf="%~dpn1_u.pdf"

rem pdftk %1 output %pdf% uncompress & goto EOF
qpdf --stream-data=uncompress %1 %pdf% 2> nul & goto EOF

:HELP
echo Usage: pdfu file
echo.

:EOF
