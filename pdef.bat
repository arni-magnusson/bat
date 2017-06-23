@echo off
setlocal
if [%1]==[] goto HELP
if [%1]==[--help] goto HELP
REM ############################################################################
REM                                                                            #
REM Script:   pdef file                                                        #
REM                                                                            #
REM Purpose:  Redistill PDF document with default quality                      #
REM                                                                            #
REM Args:     file is a PDF document                                           #
REM                                                                            #
REM Requires: gswin32c                                                         #
REM                                                                            #
REM Returns:  Creates filename_.pdf in current directory                       #
REM                                                                            #
REM ############################################################################

set gsargs=-sDEVICE=pdfwrite -dEPSCrop -dPDFSETTINGS=/default^
 -dCompatibilityLevel=1.4 -dSAFER -q -o
set pdf="%~dpn1_.pdf"
gswin32c %gsargs% %pdf% %1
goto EOF

:HELP
echo Usage: pdef file
echo.

:EOF
