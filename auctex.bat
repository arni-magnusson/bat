@echo off
setlocal
if [%1]==[] goto HELP
if [%1]==[--help] goto HELP
REM ####################################################################################################################
REM                                                                                                                    #
REM Script:   auctex [-c] [-k] [-s] [-t] [-v] [-p paper] file                                                          #
REM                                                                                                                    #
REM Purpose:  Compile or view LaTeX document from Emacs                                                                #
REM                                                                                                                    #
REM Args:     c converts document to PDF format the long way: tex->dvi->ps->pdf                                        #
REM           k knits Rnw to PDF                                                                                       #
REM           s sweaves Rnw to PDF                                                                                     #
REM           t tangles Rnw to R                                                                                       #
REM           v invokes PDF viewer                                                                                     #
REM           paper is the paper size, a4 (default) or letter                                                          #
REM           file is the TeX file in current Emacs buffer                                                             #
REM                                                                                                                    #
REM Requires: texify, dvips, gswin32c, sumatra, gsview32, R                                                            #
REM                                                                                                                    #
REM Example:  C-c C-c, C-c C-d, C-c C-v, C-c C-d                                                                       #
REM                                                                                                                    #
REM Returns:  Creates PDF file with same prefix in current directory if -c or -s, otherwise null                       #
REM                                                                                                                    #
REM ####################################################################################################################

rem Pop args until file=%1
set action=help
set dviargs=
set gsargs=
:STARTLOOP
if [%2]==[] goto ENDLOOP
if %1==-c set action=compile &                                    shift
if %1==-k set action=knit &                                       shift
if %1==-p set dviargs=-t %2 & set gsargs=-sPAPERSIZE=%2 & shift & shift
if %1==-s set action=sweave &                                     shift
if %1==-t set action=tangle &                                     shift
if %1==-v set action=view &                                       shift
goto STARTLOOP
:ENDLOOP

set dviargs=%dviargs% -P pdf
set gsargs=%gsargs% -sDEVICE=pdfwrite -dPDFSETTINGS=/prepress -dCompatibilityLevel=1.4 -dSAFER -q -o
set tex="%~dpn1.tex"
set dvi="%~dpn1.dvi"
set ps="%~dpn1.ps"
set pdf="%~dpn1.pdf"
set Rnw="%~nx1"
set Rnwpdf=%Rnw:.Rnw=.pdf%
set sumatra=%gnu%/pdf/sumatra/sumatrapdf

goto %action%

:COMPILE
texify %tex%
dvips %dviargs% %dvi%
gswin32c %gsargs% %pdf% %ps%
goto EOF

:KNIT
if %~x1==.tex echo Error: knitr file should not be named .tex & goto EOF
Rscript --vanilla -e "library(knitr);knit('%Rnw%')"
latexmk -g -latexoption=-include-directory=c:/gnu/r/share/texmf -pdf %tex%
goto EOF

:SWEAVE
if %~x1==.tex echo Error: Sweave file should not be named .tex & goto EOF
Rscript --vanilla -e "Sweave('%Rnw%',debug=TRUE,encoding='UTF-8')"
latexmk -g -latexoption=-include-directory=c:/gnu/r/share/texmf -pdf %tex%
goto EOF

:TANGLE
goto EOF

:VIEW
if exist %pdf% (%sumatra% %pdf%) else (%sumatra% %Rnwpdf%)
goto EOF

:HELP
echo Usage: auctex [-c] [-k] [-s] [-t] [-v] [-p paper] file
echo.

:EOF
