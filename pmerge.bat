@echo off
setlocal
if [%1]==[] goto HELP
if [%1]==[--help] goto HELP
REM ####################################################################################################################
REM                                                                                                                    #
REM Script:   pmerge files                                                                                             #
REM                                                                                                                    #
REM Purpose:  Merge PDF documents                                                                                      #
REM                                                                                                                    #
REM Args:     files is a space-separated list of files                                                                 #
REM                                                                                                                    #
REM Requires: sejda-console                                                                                            #
REM                                                                                                                    #
REM Returns:  Creates out.pdf in current directory                                                                     #
REM                                                                                                                    #
REM ####################################################################################################################

sejda-console merge -f %* -o out.pdf --overwrite & goto EOF

:HELP
echo Usage: pmerge files
echo.

:EOF
