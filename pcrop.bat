@echo off
setlocal
if [%1]==[] goto HELP
if [%1]==[--help] goto HELP
REM ####################################################################################################################
REM                                                                                                                    #
REM Script:   pcrop file B:L T:R                                                                                       #
REM                                                                                                                    #
REM Purpose:  Crop PDF document                                                                                        #
REM                                                                                                                    #
REM Args:     file is file to crop                                                                                     #
REM                                                                                                                    #
REM Requires: sejda-console                                                                                            #
REM                                                                                                                    #
REM Returns:  Creates out.pdf in same directory                                                                        #
REM                                                                                                                    #
REM ####################################################################################################################

sejda-console crop -f %1 -o out.pdf --cropAreas [%2][%3] --overwrite & goto EOF

:HELP
echo Usage: pcrop file B:L T:R
echo.
echo For example, pcrop x.pdf 10:10 700:500
echo.

:EOF
