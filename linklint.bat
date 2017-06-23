@echo off
setlocal
if [%1]==[] goto HELP
if [%1]==[--help] goto HELP
REM ############################################################################
REM                                                                            #
REM Script:   linklint [-net] [/@] file                                        #
REM                                                                            #
REM Purpose:  Validate links in HTML file(s)                                   #
REM                                                                            #
REM Args:     net validates internet (external) links too                      #
REM           /@ checks all web pages recursively                              #
REM                                                                            #
REM Requires: perl linklint                                                    #
REM                                                                            #
REM Returns:  On-screen report                                                 #
REM                                                                            #
REM ############################################################################

set linklint=%gnu%/internet/linklint/linklint

perl %linklint% %*
goto EOF

:HELP
set linklint=%gnu%/internet/linklint/linklint
perl %linklint%
echo.

:EOF
