@echo off
setlocal
if [%1]==[] goto HELP
if [%1]==[--help] goto HELP
REM ############################################################################
REM                                                                            #
REM Script:   2html file                                                       #
REM                                                                            #
REM Purpose:  Convert Markdown, PDF, TeX, or Rd file to HTML format            #
REM                                                                            #
REM Args:     file is file to convert                                          #
REM                                                                            #
REM Requires: latex2html, pdftohtml, R                                         #
REM                                                                            #
REM Returns:  Creates HTML file with same prefix in current directory          #
REM                                                                            #
REM ############################################################################

set latex2htmlargs=-html_version 4.0 -math -noinfo -nonavigation -noaddress^
 -split 0 -link 1 -lcase_tags
set html="%~dpn1.html"

goto %~x1

:.MD
stmd %1 > %html%                  & goto EOF

:.PDF
pdftohtml -c -noframes %1         & goto EOF

:.RD
R CMD Rdconv -t html -o %html% %1 & goto EOF

:.TEX
latex2html %latex2htmlargs% %*    & goto EOF

:.TEXI
makeinfo --html %*

:HELP
echo Usage: 2html file
echo.

:EOF
