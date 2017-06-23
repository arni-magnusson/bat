@echo off
setlocal
if [%1]==[] goto HELP
if [%1]==[--help] goto HELP
REM ####################################################################################################################
REM                                                                                                                    #
REM Script:   diffme [--left] [--suppress] [-W width] file1 file2                                                      #
REM                                                                                                                    #
REM Purpose:  Show differences between two files, arranged in two columns                                              #
REM                                                                                                                    #
REM Args:     left shows entire file1 in left column, and only file2 diffs in right column                             #
REM           suppress shows only diffs in each columns                                                                #
REM           W is width of each column                                                                                #
REM           file1 and file2 are files to compare                                                                     #
REM                                                                                                                    #
REM Notes:    Thin wrapper to remind user about three helpful options for 2-column display                             #
REM                                                                                                                    #
REM Requires: diff                                                                                                     #
REM                                                                                                                    #
REM Returns:  File differences                                                                                         #
REM                                                                                                                    #
REM ####################################################################################################################

diff -y %*
goto EOF

:HELP
echo Usage: diffme [--left] [--suppress] [-W width] file1 file2
echo.

:EOF
