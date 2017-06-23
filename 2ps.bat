@echo off
setlocal
if [%1]==[] goto HELP
if [%1]==[--help] goto HELP
REM ############################################################################
REM                                                                            #
REM Script:   2ps [-paper=type] file                                           #
REM                                                                            #
REM Purpose:  Convert DVI, HTML or PDF file to PS format                       #
REM                                                                            #
REM Args:     paper is a4 or letter, when converting DVI or PDF                #
REM           file is file to convert                                          #
REM                                                                            #
REM Notes:    HTML conversion options are set in (1) html2ps/html2psrc and in  #
REM             local (2) html2ps.css                                          #
REM                                                                            #
REM Requires: dvips, gswin32c, html2ps, latex, pdftops                         #
REM                                                                            #
REM Returns:  Creates PS file with same prefix in current directory            #
REM                                                                            #
REM ############################################################################

rem Pop args until file=%1
set dviargs=
set pdfargs=
:STARTLOOP
if [%2]==[] goto ENDLOOP
if %1==-paper set dviargs=-t %2 & set pdfargs=-paper %2& shift & shift
goto STARTLOOP
:ENDLOOP

set perlargs=%gnu%/pdf/html2ps/html2ps
set dviargs=%dviargs% -Ppdf
set ps="%~dpn1.ps"

goto %~x1

:.DVI
dvips %dviargs% %1      & goto EOF

:.HTML
perl %perlargs% %1>%ps% & goto EOF

:.PDF
pdftops %pdfargs% %1    & goto EOF

:HELP
echo Usage: 2ps [-paper=type] file
echo.

:EOF
