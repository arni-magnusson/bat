@echo off
setlocal
if [%1]==[] goto HELP
if [%1]==[--help] goto HELP
REM ############################################################################
REM                                                                            #
REM Script:   2png [-ag=n] [-at=n] [-colors=n] [-dpi=n] [-gray] [-mono] file   #
REM                                                                            #
REM Purpose:  Convert bitmap, EPS, or PDF file to PNG format                   #
REM                                                                            #
REM Args:     ag is anti-aliasing for graphics when converting PS/PDF file     #
REM             (1=none, 4=full[default])                                      #
REM           at is anti-aliasing for text when converting PS/PDF file         #
REM             (1=none, 4=full[default])                                      #
REM           colors is number of colors in PNG palette                        #
REM           dpi is output resolution when converting PS/PDF file             #
REM             (72=low[default], 600=high)                                    #
REM           gray uses grayscale palette                                      #
REM           mono uses monochrome palette                                     #
REM           file is file to convert                                          #
REM                                                                            #
REM Requires: convert, gswin64c                                                #
REM                                                                            #
REM Returns:  Creates PNG file with same prefix in current directory           #
REM                                                                            #
REM ############################################################################

rem Pop args until file=%1
set a=4
set b=4
set gsargs=
set gscolors=16777216
set gsdevice=png16m
set imargs=-depth 8 -type optimize +dither
set imcolors=16777216
:STARTLOOP
if [%2]==[] goto ENDLOOP
if %1==-ag set a=%2&                                             shift & shift
if %1==-at set b=%2&                                             shift & shift
if %1==-colors set gscolors=%2& set imcolors=%2&                 shift & shift
if %1==-dpi set gsargs=%gsargs% -r%2&                            shift & shift
if %1==-gray set gsdevice=pnggray& set imargs=%imargs% -colorspace gray& shift
if %1==-mono set gsdevice=pngmono& set imargs=%imargs% -monochrome&      shift
goto STARTLOOP
:ENDLOOP

rem Set a and b
set gsargs=%gsargs% -dGraphicsAlphaBits=%a%
set gsargs=%gsargs% -dTextAlphaBits=%b%

set png="%~dpn1.png"
set convert=%gnu%/graphics/imagick/convert

rem Choose simpler Ghostscript PNG device if appropriate
if %gsdevice%==png16m if %gscolors% LEQ 16 set gsdevice=png16
if %gsdevice%==png16m if %gscolors% LEQ 256 set gsdevice=png256
set gsargs=%gsargs% -sDEVICE=%gsdevice% -dEPSCrop -dSAFER -q -o

rem Pass ImageMagick colors if user passed -colors
if %imcolors% LSS 16777216 set imargs=%imargs% -colors %imcolors%

goto %~x1

:.BMP
:.GIF
:.ICO
:.JPG
:.TIF
:.XPM
%convert% %imargs% %1 %png% & goto EOF

:.EPS
:.PDF
:.PS
gswin64c %gsargs% %png% %1  & goto EOF

:.PBM
:.PNM
:.PPM
pnmtopng %1>%png%           & goto EOF

:HELP
echo Usage: 2png [-ag=n] [-at=n] [-colors=n] [-dpi=n] [-gray] [-mono] file
echo.

:EOF
