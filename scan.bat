@echo off
setlocal
if [%1]==[] goto HELP
if [%1]==[--help] goto HELP
REM ############################################################################
REM                                                                            #
REM Script:   scan                                                             #
REM                                                                            #
REM Purpose:  Scan file(s) with Sophos Anti-Virus                              #
REM                                                                            #
REM Args:     file is file(s) to scan, supporting wildcards: *=any, ?=one char #
REM                                                                            #
REM Notes:    http://downloads.sophos.com/readmes/readcli.txt                  #
REM                                                                            #
REM Requires: sav32cli                                                         #
REM                                                                            #
REM Returns:  Shows scan results on screen                                     #
REM                                                                            #
REM ############################################################################

"%programfiles%\sophos\sophos anti-virus\sav32cli" %*

goto EOF

:HELP

echo Usage: scan file(s)
echo Detailed help: "%programfiles%\sophos\sophos anti-virus\sav32cli" -help
echo.

:EOF
