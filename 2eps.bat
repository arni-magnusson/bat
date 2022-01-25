@echo off
setlocal
if [%1]==[] goto HELP
if [%1]==[--help] goto HELP
REM ############################################################################
REM                                                                            #
REM Script:   2eps [-dpi=n] file                                               #
REM                                                                            #
REM Purpose:  Convert bitmap, PS, or PDF file to EPS format                    #
REM                                                                            #
REM Args:     dpi is output resolution when converting PS file                 #
REM           file is PS file to convert                                       #
REM                                                                            #
REM Notes:    PS->EPS gives bitmap output, consider using PS->PDF->EPS for     #
REM             vector output                                                  #
REM           PDF->EPS (pdftops) is postprocessed, replacing "% Produced" with #
REM             "%%Produced"                                                   #
REM                                                                            #
REM Requires: bmeps, convert, gswin64c, pdftops, sed                           #
REM                                                                            #
REM Returns:  Creates EPS file with same prefix in current directory           #
REM                                                                            #
REM ############################################################################

rem Pop args until file=%1
set gsargs=
:STARTLOOP
if [%2]==[] goto ENDLOOP
if %1==-dpi set gsargs=-r%2& shift & shift
goto STARTLOOP
:ENDLOOP

set bmargs=-c -p 3 --quiet
set convert=%gnu%/graphics/imagick/convert
set gsargs=%gsargs% -sDEVICE=epswrite -dSAFER -q -o
set pdfargs=-eps
set eps="%~dpn1.eps"
set png=%temp%\temp.png

goto %~x1

:.BMP
:.GIF
:.PPM
:.TIF
%convert% %1 %png%
bmeps %bmargs% %png% %eps%
del %png%                     & goto EOF

:.JPG
:.PNG
bmeps %bmargs% %1 %eps%       & goto EOF

:.PS
gswin64c %gsargs% %eps% %1    & goto EOF

:.PDF
pdftops %pdfargs% %1
sed -i "2s/%% P/%%%%P/" %eps% & goto EOF

:HELP
echo Usage: 2eps [-dpi=n] file
echo.

:EOF
