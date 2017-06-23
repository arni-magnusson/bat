@echo off
setlocal
if [%1]==[] goto HELP
if [%1]==[--help] goto HELP
REM ############################################################################
REM                                                                            #
REM Script:   pdfmerge files [options]                                         #
REM                                                                            #
REM Purpose:  Merge PDF documents                                              #
REM                                                                            #
REM Args:     files is a space-separated list of files                         #
REM           options are passed to pdftk                                      #
REM                                                                            #
REM Requires: pdftk                                                            #
REM                                                                            #
REM Returns:  Creates out.pdf in current directory                             #
REM                                                                            #
REM ############################################################################

pdftk %* output out.pdf
goto EOF

:HELP
echo Usage: pdfmerge files [options]
echo.

:EOF
