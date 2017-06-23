@echo off
setlocal
if [%1]==[] goto HELP
if [%1]==[--help] goto HELP
REM ####################################################################################################################
REM                                                                                                                    #
REM Script:   2tif [-ag=n] [-at=n] [-dpi=n] file                                                                       #
REM                                                                                                                    #
REM Purpose:  Convert bitmap, EPS, or PDF file to TIF format                                                           #
REM                                                                                                                    #
REM Args:     ag is anti-aliasing for graphics when converting EPS file (1=none[default], 4=full)                      #
REM           at is anti-aliasing for text when converting EPS file (1=none[default], 4=full)                          #
REM           dpi is output resolution when converting EPS file (72=low[default], 600=high)                            #
REM           file is file to convert                                                                                  #
REM                                                                                                                    #
REM Notes:    EPS/PDF/PS -> TIF results in full tiff24nc palette, but bitmap -> TIF may result in smaller palette      #
REM                                                                                                                    #
REM Requires: convert, gswin32c                                                                                        #
REM                                                                                                                    #
REM Returns:  Creates TIF file with same prefix in current directory                                                   #
REM                                                                                                                    #
REM ####################################################################################################################

rem Pop args until file=%1
set gsargs=
:STARTLOOP
if [%2]==[] goto ENDLOOP
if %1==-ag set gsargs=%gsargs% -dGraphicsAlphaBits=%2 & shift & shift
if %1==-at set gsargs=%gsargs% -dTextAlphaBits=%2 &     shift & shift
if %1==-dpi set gsargs=%gsargs% -r%2 &                  shift & shift
goto STARTLOOP
:ENDLOOP

set convert=%gnu%/graphics/imagick/convert
set imargs=-compress none
set gsargs=%gsargs% -sDEVICE=tiff24nc -dEPSCrop -dSAFER -q -o
set tif="%~dpn1.tif"

goto %~x1

:.BMP
:.GIF
:.ICO
:.JPG
:.PNG
%convert% %imargs% %1 %tif% & goto EOF

:.EPS
:.PDF
:.PS
echo Consider using 2png and then convert PNG-^>TIF, for fine control and small file
echo.
gswin32c %gsargs% %tif% %1  & goto EOF

:.PBM
:.PNM
:.PPM
pnmtotiff %1>%tif%          & goto EOF

:HELP
echo Usage: 2tif [-ag=n] [-at=n] [-dpi=n] file
echo.

:EOF
