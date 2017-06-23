@echo off
setlocal
if [%2]==[] goto HELP
if [%1]==[--help] goto HELP
REM ############################################################################
REM                                                                            #
REM Script:  apply filter cmd                                                  #
REM                                                                            #
REM Purpose: Apply command to many files in current directory                  #
REM                                                                            #
REM Args:    filter is a pattern to match files, e.g. *                        #
REM          cmd is a command, e.g. 2jpg -quality=100                          #
REM                                                                            #
REM Notes:   Thin for-loop wrapper                                             #
REM          Subdirs are ignored                                               #
REM                                                                            #
REM Warning: Only relatively short commands (7 spaces) are supported           #
REM                                                                            #
REM Returns: Applies command to all files in current directory                 #
REM                                                                            #
REM ############################################################################

set filter=%1
set cmd=%2 %3 %4 %5 %6 %7 %8 %9

for %%F in (%filter%) do %cmd% "%%F"
goto EOF

:HELP
echo Usage: apply filter cmd
echo.

:EOF
