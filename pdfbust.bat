@echo off
setlocal
if [%1]==[] goto HELP
if [%1]==[--help] goto HELP
REM ####################################################################################################################
REM                                                                                                                    #
REM Script:   pdfbust file                                                                                             #
REM                                                                                                                    #
REM Purpose:  Remove first page from PDF file                                                                          #
REM                                                                                                                    #
REM Args:     file is the file to handle                                                                               #
REM                                                                                                                    #
REM Notes:    Writes backup bust.pdf in %temp%                                                                         #
REM                                                                                                                    #
REM Requires: pdftk                                                                                                    #
REM                                                                                                                    #
REM Returns:  Overwrites original PDF file, after removing first page                                                  #
REM                                                                                                                    #
REM ####################################################################################################################

set pdftkargs=cat 2-end output
set backup=%temp%\bust.pdf
set bust="%~dpn1_bust.pdf"

copy %1 %backup% > nul
pdftk %1 %pdftkargs% %bust%
move %bust% %1
goto EOF

:HELP
echo Usage: pdfbust file
echo.

:EOF
