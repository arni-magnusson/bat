@echo off
setlocal
if [%1]==[] goto HELP
if [%1]==[--help] goto HELP
REM ############################################################################
REM                                                                            #
REM Script:   2pdf [-flate] [-gray] [-paper=type] [-quality=prepress] file     #
REM                                                                            #
REM Purpose:  Convert bitmap, TEX, DTX, TEXI, DVI, PS, EPS, or PDF file to PDF #
REM             format                                                         #
REM                                                                            #
REM Args:     flate selects Flate compression, to prevent JPEG artifacts on    #
REM             embedded bitmaps                                               #
REM           gray creates grayscale PDF                                       #
REM           paper selects PDF page size, a4 or letter when converting DVI or #
REM             PS file                                                        #
REM           quality determines image quality (screen, ebook, printer,        #
REM             prepress, default)                                             #
REM           file is file to convert                                          #
REM                                                                            #
REM Requires: bmeps, convert, dvipdfm, gswin64c, texi2dvi, texify              #
REM                                                                            #
REM Warning:  -paper is often ignored by dvips, must edit manually in PS file  #
REM             (change line following %%BeginPaperSize)                       #
REM                                                                            #
REM Returns:  Creates PDF file with same prefix in current directory, or       #
REM             filename_.pdf if input file was PDF                            #
REM                                                                            #
REM ############################################################################

rem Pop args until file=%1
set bmargs=-c
set dviargs=
set gsargs=
set quality=prepress
:STARTLOOP
if [%2]==[] goto ENDLOOP
if %1==-flate set gsargs=%gsargs% -dAutoFilterColorImages=false -dColorImageFilter=/FlateEncode& shift
if %1==-gray set bmargs=-g&                                  shift
if %1==-paper set dviargs=-p %2 & set gsargs=-sPAPERSIZE=%2& shift & shift
if %1==-quality set quality=%2&                              shift & shift
goto STARTLOOP
:ENDLOOP

set bmargs=%bmargs% -p 3 --quiet
set convert=%gnu%/graphics/imagick/convert
set gsargs=%gsargs% -sDEVICE=pdfwrite -dEPSCrop -dPDFSETTINGS=/%quality% -dCompatibilityLevel=1.4 -dSAFER -q -o
set texargs=-c -p -t @finalout
set eps=%temp%\temp.eps
set png=%temp%\temp.png
set pdf="%~dpn1.pdf"

goto %~x1

:.BMP
:.GIF
:.TIF
%convert% %1 %png%
bmeps %bmargs% %png% %eps%
gswin64c %gsargs% %pdf% %eps%
del %png% %eps%               & goto EOF

:.JPG
:.PNG
:.PNM
:.PPM
bmeps %bmargs% %1 %eps%
gswin64c %gsargs% %pdf% %eps%
del %eps%                     & goto EOF

:.DVI
dvipdfm %dviargs% %1          & goto EOF

:.PS
gswin64c %gsargs% %pdf% %1    & goto EOF

:.PDF
set pdf="%~dpn1_.pdf"
gswin64c %gsargs% %pdf% %1    & goto EOF

:.EPS
gswin64c %gsargs% %pdf% %1    & goto EOF

:.TEX
:.DTX
texify %texargs% %1           & goto EOF

:.TEXI
:.TEXINFO
:.TXI
texi2dvi %texargs% %1         & goto EOF

:HELP
echo Usage: 2pdf [-flate] [-gray] [-paper=type] [-quality=prepress] file
echo.
echo Quality settings: screen, ebook, printer, prepress, default.
echo.
echo Use -flate to prevent JPEG artifacts on embedded bitmaps.
echo.

:EOF
