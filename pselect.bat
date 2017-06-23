@echo off
setlocal
if [%1]==[] goto HELP
if [%1]==[--help] goto HELP
REM ############################################################################
REM                                                                            #
REM Script:   pselect file pages                                               #
REM                                                                            #
REM Purpose:  Extract pages from PDF document                                  #
REM                                                                            #
REM Args:     file is the file to process                                      #
REM           pages is a comma-separated page range, e.g. 4-5,8-               #
REM                                                                            #
REM Requires: sejda-console                                                    #
REM                                                                            #
REM Returns:  Creates out.pdf in current directory                             #
REM                                                                            #
REM ############################################################################

sejda-console extractpages -f %1 -o out.pdf^
 -s %2,%3,%4,%5,%6,%7,%8,%9 --overwrite & goto EOF

:HELP
echo Usage: pselect file pages
echo.
echo For example, pselect x.pdf 4-5,8-
echo.

:EOF
