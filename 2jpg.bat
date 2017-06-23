@echo off
setlocal
if [%1]==[] goto HELP
if [%1]==[--help] goto HELP
REM ####################################################################################################################
REM                                                                                                                    #
REM Script:   2jpg [-dpi=n] [-quality=n] file                                                                          #
REM                                                                                                                    #
REM Purpose:  Convert bitmap or EPS file to JPG format                                                                 #
REM                                                                                                                    #
REM Args:     dpi is output resolution when converting EPS file (72=low[default], 600=high)                            #
REM           quality is JPG compression quality, 0-100 (default is 75)                                                #
REM           file is file to convert                                                                                  #
REM                                                                                                                    #
REM Requires: convert, gswin32c                                                                                        #
REM                                                                                                                    #
REM Returns:  Creates JPG file with same prefix in current directory                                                   #
REM                                                                                                                    #
REM ####################################################################################################################

rem Pop args until file=%1
set gsargs=
set imargs=
set pnmargs=
:STARTLOOP
if [%2]==[] goto ENDLOOP
if %1==-dpi set gsargs=%gsargs% -r%2&                                                              shift & shift
if %1==-quality set gsargs=%gsargs% -dJPEGQ=%2 & set imargs=-quality %2 & set pnmargs=-quality %2& shift & shift
goto STARTLOOP
:ENDLOOP

set convert=%gnu%/graphics/imagick/convert
set gsargs=%gsargs% -sDEVICE=jpeg -dEPSCrop -dSAFER -q -o
set jpg="%~dpn1.jpg"

goto %~x1

:.BMP
:.GIF
:.NEF
:.PNG
:.TIF
%convert% %imargs% %1 %jpg%  & goto EOF

:.EPS
gswin32c %gsargs%%jpg% %1    & goto EOF

:.PBM
:.PNM
:.PPM
pnmtojpeg %pnmargs% %1>%jpg% & goto EOF

:HELP
echo Usage: 2jpg [-dpi=n] [-quality=n] file
echo.

:EOF
