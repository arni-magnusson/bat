@echo off
setlocal
if [%1]==[--help] goto HELP
REM ############################################################################
REM                                                                            #
REM Script:   llR [dir]                                                        #
REM                                                                            #
REM Purpose:  List directories and files recursively, showing                  #
REM             perm|size|date|name                                            #
REM                                                                            #
REM Args:     dir is the directory or file to show (default is current         #
REM             directory)                                                     #
REM                                                                            #
REM Notes:    Similar to ls -AlR, but more compact                             #
REM                                                                            #
REM Requires: rsync                                                            #
REM                                                                            #
REM Returns:  Directory and file information is shown                          #
REM                                                                            #
REM ############################################################################

if [%2] NEQ [] goto HELP
if [%1]==[] (set dir=.) else (set dir=%1)

rsync -a --list-only %dir%
goto EOF

:HELP
echo Usage: llR [dir]
echo.

:EOF
