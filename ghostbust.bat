@echo off
setlocal
if [%1]==[] goto HELP
if [%1]==[--help] goto HELP
REM ############################################################################
REM                                                                            #
REM Script:   ghostbust [-quality=prepress] file                               #
REM                                                                            #
REM Purpose:  Remove first page from PDF file                                  #
REM                                                                            #
REM Args:     quality determines image quality (screen, ebook, printer,        #
REM             prepress, default) file is the file to handle                  #
REM                                                                            #
REM Notes:    Redistills from scratch, unlike pdfbust.bat                      #
REM           Writes backup ghostbust.pdf in %temp%                            #
REM                                                                            #
REM Requires: gswin32c                                                         #
REM                                                                            #
REM Returns:  Overwrites original PDF file, after removing first page          #
REM                                                                            #
REM ############################################################################

rem Pop args until file=%1
set quality=prepress
:STARTLOOP
if [%2]==[] goto ENDLOOP
if %1==-quality set quality=%2 & shift & shift
goto STARTLOOP
:ENDLOOP

set gsargs=-dFirstPage=2 -sDEVICE=pdfwrite -dPDFSETTINGS=/%quality% -dCompatibilityLevel=1.4 -q -o
set backup=%temp%\ghostbust.pdf
set bust=%1_bust.pdf

copy %1 %backup%
gswin32c %gsargs% %bust% %1
move %bust% %1
goto EOF

:HELP
echo Usage: ghostbust [-quality=prepress] file
echo.
echo Quality settings: screen, ebook, printer, prepress, default.
echo.

:EOF
