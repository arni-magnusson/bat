@echo off
setlocal
if [%1]==[] goto HELP
if [%1]==[--help] goto HELP
REM ############################################################################
REM                                                                            #
REM Script:   ghostmerge file(s)                                               #
REM                                                                            #
REM Purpose:  Merge PS or PDF files into one PDF file                          #
REM                                                                            #
REM Args:     file(s) are files to merge                                       #
REM                                                                            #
REM Notes:    No args are supported, to allow %* to contain many files and no  #
REM             args                                                           #
REM           Therefore, the quality level is hardwired (prepress)             #
REM                                                                            #
REM Requires: gswin32c                                                         #
REM                                                                            #
REM Returns:  Creates file out.pdf in current directory                        #
REM                                                                            #
REM ############################################################################

set gsargs=-sDEVICE=pdfwrite -dPDFSETTINGS=/prepress -dCompatibilityLevel=1.4 -dSAFER -q -o
set pdf=out.pdf

gswin32c %gsargs% %pdf% %*
goto EOF

:HELP
echo Usage: ghostmerge file(s)
echo.

:EOF
