@echo off
setlocal
if [%1]==[] goto HELP
if [%1]==[--help] goto HELP
REM ####################################################################################################################
REM                                                                                                                    #
REM Script:   ghostselect [-quality=prepress] [-first=n] [-last=n] file                                                #
REM                                                                                                                    #
REM Purpose:  Extract pages from PDF document                                                                          #
REM                                                                                                                    #
REM Args:     quality determines image quality (screen, ebook, printer, prepress, default)                             #
REM           first is first page in range                                                                             #
REM           last is last page in range                                                                               #
REM           file is PDF file to extract from                                                                         #
REM                                                                                                                    #
REM Requires: gswin32c                                                                                                 #
REM                                                                                                                    #
REM Returns:  Creates out.pdf in current directory, containing selected pages                                          #
REM                                                                                                                    #
REM ####################################################################################################################

rem Pop args until file=%1
set gsargs=
set quality=prepress
:STARTLOOP
if [%2]==[] goto ENDLOOP
if %1==-quality set quality=%2 &                   shift & shift
if %1==-first set gsargs=%gsargs% -dFirstPage=%2 & shift & shift
if %1==-last  set gsargs=%gsargs% -dLastPage=%2 &  shift & shift
goto STARTLOOP
:ENDLOOP

set gsargs=%gsargs% -sDEVICE=pdfwrite -dPDFSETTINGS=/%quality% -dCompatibilityLevel=1.4 -q -o
set pdf=out.pdf

gswin32c %gsargs% %pdf% %1
goto EOF

:HELP
echo Usage: ghostselect [-quality=prepress] [-first=n] [-last=n] file
echo.
echo Quality settings: screen, ebook, printer, prepress, default.
echo.

:EOF
