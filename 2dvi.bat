@echo off
setlocal
if [%1]==[] goto HELP
if [%1]==[--help] goto HELP
REM ####################################################################################################################
REM                                                                                                                    #
REM Script:   2dvi file                                                                                                #
REM                                                                                                                    #
REM Purpose:  Convert TEX, DTX, or TEXI/TXI file to DVI format                                                         #
REM                                                                                                                    #
REM Args:     file is the TEX, DTX, or TEXI file to convert                                                            #
REM                                                                                                                    #
REM Requires: texify, texi2dvi                                                                                         #
REM                                                                                                                    #
REM Returns:  Creates DVI file with same prefix in current directory                                                   #
REM                                                                                                                    #
REM ####################################################################################################################

set texiargs=-c

goto %~x1

:.TEX
:.DTX
texify %*   & goto EOF

:.TEXI
:.TXI
texi2dvi %texiargs% %* & goto EOF

:HELP
echo Usage: 2dvi file
echo.

:EOF
