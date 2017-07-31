@echo off
setlocal
if [%1]==[--help] goto HELP
REM ############################################################################
REM                                                                            #
REM Script:   lorem                                                            #
REM                                                                            #
REM Purpose:  Show dummy paragraphs "Lorem ipsum ..."                          #
REM                                                                            #
REM Args:     arg is the number of paragraphs (default 1, max 52)              #
REM                                                                            #
REM Requires: lynx                                                             #
REM                                                                            #
REM Returns:  Shows text on screen                                             #
REM                                                                            #
REM ############################################################################

rem One paragraph by default, otherwise shave off possible hyphen
set arg=%1
if [%arg%]==[] (set n=1) else (set n=%arg:-=%)
if %n% GTR 52 set n=52
set /a last=-1+2*%n%

lynx -source http://desktoppub.about.com/library/weekly/lorem.txt | sed -n "1,%last%p"

goto EOF

:HELP
echo Usage: lorem [-1]
echo.

:EOF
