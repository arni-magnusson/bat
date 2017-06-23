@echo off
setlocal
if [%1]==[] goto HELP
if [%1]==[--help] goto HELP
REM ####################################################################################################################
REM                                                                                                                    #
REM Script:   htmltidy [-latin1] [-write] file                                                                         #
REM                                                                                                                    #
REM Purpose:  Validate HTML with screen report (default) or create out.html                                            #
REM                                                                                                                    #
REM Args:     latin1 uses Latin-1 encoding for input and output                                                        #
REM           write creates out.html file in current directory                                                         #
REM           file is the HTML file to validate                                                                        #
REM                                                                                                                    #
REM Requires: tidy                                                                                                     #
REM                                                                                                                    #
REM Returns:  Creates out.html file in current directory if -write, otherwise null                                     #
REM                                                                                                                    #
REM ####################################################################################################################

rem Pop args until file=%1
set encoding=-utf8
set tidyargs=-e
:STARTLOOP
if [%2]==[] goto ENDLOOP
if %1==-latin1 set encoding=-latin1 & shift
if %1==-write set tidyargs=-o out.html -i -wrap 123 -c -b -q & shift
goto STARTLOOP
:ENDLOOP

rem tidyargs is either "-e" or "-o out.html -i -wrap 123 -c -b -q", and in both cases we append encoding
set tidyargs=%tidyargs% %encoding%

tidy %tidyargs% %1 & goto EOF

:HELP
echo Usage: htmltidy [-latin1] [-write] file
echo.

:EOF
