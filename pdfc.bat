@echo off
setlocal
if [%1]==[] goto HELP
if [%1]==[--help] goto HELP
REM ####################################################################################################################
REM                                                                                                                    #
REM Script:   pdfc file                                                                                                #
REM                                                                                                                    #
REM Purpose:  Compress PDF document                                                                                    #
REM                                                                                                                    #
REM Args:     file is file to compress                                                                                 #
REM                                                                                                                    #
REM Requires: qpdf                                                                                                     #
REM                                                                                                                    #
REM Returns:  Creates filename_c.pdf in same directory                                                                 #
REM                                                                                                                    #
REM ####################################################################################################################

set pdf="%~dpn1_c.pdf"

rem pdftk %1 output %pdf% compress & goto EOF
qpdf %1 %pdf% & goto EOF

:HELP
echo Usage: pdfc file
echo.

:EOF
