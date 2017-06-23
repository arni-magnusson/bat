@echo off
setlocal
if [%1]==[] goto HELP
if [%1]==[--help] goto HELP
REM ############################################################################
REM                                                                            #
REM Script:   2csv file                                                        #
REM                                                                            #
REM Purpose:  Convert HES or PSV file to CSV format                            #
REM                                                                            #
REM Args:     file is the HES or PSV file                                      #
REM                                                                            #
REM Requires: unpsv                                                            #
REM                                                                            #
REM Returns:  Creates CSV file with same prefix in current directory           #
REM                                                                            #
REM ############################################################################

set csv="%~dpn1.csv"
unpsv %1>%csv%
goto EOF

:HELP
echo Usage: 2csv file
echo.

:EOF
