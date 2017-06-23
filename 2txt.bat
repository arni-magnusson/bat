@echo off
setlocal
if [%1]==[] goto HELP
if [%1]==[--help] goto HELP
REM ############################################################################
REM                                                                            #
REM Script:   2txt [options] file                                              #
REM                                                                            #
REM Purpose:  Convert DOC, DVI, HTML, PDF, PS, or TEX file to TXT format       #
REM                                                                            #
REM Args:     Options are passed on to antiword, detex, dvi2tty, or pdftotext  #
REM                                                                            #
REM Notes:    Try these options for TEX (-c, -e, -n, -s, -w),                  #
REM             DVI (-p, -P, -w), and PDF (-layout, -raw)                      #
REM                                                                            #
REM Requires: antiword, detex, dvi2tty, gswin32c, lynx, pdftotext              #
REM                                                                            #
REM Returns:  Creates TXT file with same prefix in current directory           #
REM                                                                            #
REM ############################################################################

rem Pop args until file=%1
set userargs=
:STARTLOOP
if [%2]==[] goto ENDLOOP
set userargs=%userargs% %1 & shift
goto STARTLOOP
:ENDLOOP

set gsargs=-dSIMPLE ps2ascii.ps -q -dBATCH -dSAFER
set lynxargs=-dump -nolist -width 123
set txt="%~dpn1.txt"

goto %~x1

:.DOC
antiword %userargs% %1> %txt% & goto EOF

:.DVI
dvi2tty %userargs% %1> %txt%  & goto EOF

:.HTML
lynx %lynxargs% %1> %txt%     & goto EOF

:.PDF
pdftotext %userargs% %1 %txt% & goto EOF

:.PS
gswin32c %gsargs% %1> %txt%   & goto EOF

:.TEX
detex %userargs% %1> %txt%    & goto EOF

:HELP
echo Usage: 2txt [options] file
echo Try these options for DVI (-p, -P, -w)
echo                       PDF (-layout, -raw)
echo                       TEX (-c, -e, -n, -s, -w)
echo.

:EOF
