@echo off
setlocal
if [%1]==[] goto HELP
if [%1]==[--help] goto HELP
REM ############################################################################
REM                                                                            #
REM Script:   2tex [-ban=tag] [-border] [-font=10] file                        #
REM                                                                            #
REM Purpose:  Convert HTML or Rd file to TeX format                            #
REM                                                                            #
REM Args:     ban is an HTML tag whose elements should be treated as text      #
REM           border convert HTML tables with |c| and \hline borders           #
REM           font is the required font size when converting from HTML         #
REM                                                                            #
REM Notes:    Converted Rd file should be \input in a master document where    #
REM             \usepackage{Rd} is loaded                                      #
REM                                                                            #
REM Requires: html2latex, perl, R                                              #
REM                                                                            #
REM Returns:  Creates TeX file with same prefix in current directory           #
REM                                                                            #
REM ############################################################################

rem Pop args until file=%1
set html2latexargs=-I%home%/localtexmf/bin/html2latex %home%/localtexmf/bin/html2latex/html2latex
:STARTLOOP
if [%2]==[] goto ENDLOOP
if %1==-ban set html2latexargs=%html2latexargs% --ban %2 &    shift & shift
if %1==-border set html2latexargs=%html2latexargs% --border & shift
if %1==-font set html2latexargs=%html2latexargs% --font %2 &  shift & shift
goto STARTLOOP
:ENDLOOP

set tex="%~dpn1.tex"
goto %~x1

:.HTML
perl %html2latexargs% %1          & goto EOF

:.RD
R CMD Rdconv -t latex -o %tex% %1 & goto EOF

:HELP
echo Usage: 2tex [-ban=tag] [-border] [-font=10] file
echo.

:EOF
