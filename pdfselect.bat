@echo off
setlocal
if [%1]==[] goto HELP
if [%1]==[--help] goto HELP
REM ############################################################################
REM                                                                            #
REM Script:   pdfselect file pages [options]                                   #
REM                                                                            #
REM Purpose:  Extract pages from PDF document                                  #
REM                                                                            #
REM Args:     file is the file to process                                      #
REM           pages is a space-separated list of pages, like 2 4-end           #
REM           options are passed to pdftk                                      #
REM                                                                            #
REM Notes:    See pdftk --help                                                 #
REM                                                                            #
REM Warning:  Maximum 8 page ranges, e.g.                                      #
REM             pdfselect foo.pdf 1 2 3 4 5 6 7 8 9-end                        #
REM             will omit the last range                                       #
REM           Use pdftk directly for such cases                                #
REM                                                                            #
REM Requires: pdftk                                                            #
REM                                                                            #
REM Returns:  Creates file out.pdf in current directory                        #
REM                                                                            #
REM ############################################################################

pdftk %1 cat %2 %3 %4 %5 %6 %7 %8 %9 output out.pdf
goto EOF

:HELP
echo Usage: pdfselect file pages [options]
echo.

:EOF
