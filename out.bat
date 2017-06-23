@echo off
setlocal
if [%1]==[] goto HELP
if [%1]==[--help] goto HELP
REM ############################################################################
REM                                                                            #
REM Script:   out name                                                         #
REM                                                                            #
REM Purpose:  Rename out.pdf quickly                                           #
REM                                                                            #
REM Args:     name is the desired filename, without file extension             #
REM                                                                            #
REM Returns:  Renames out.pdf to name.pdf                                      #
REM                                                                            #
REM ############################################################################

mv out.pdf %1.pdf

goto EOF

:HELP
echo Usage: out name
echo.

:EOF
