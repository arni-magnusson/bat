@echo off
setlocal
if [%1]==[] goto HELP
if [%1]==[--help] goto HELP
REM ############################################################################
REM                                                                            #
REM Batch:    thumb -quality=90 -rotate=0 -size=800 [-width -height] file      #
REM                                                                            #
REM Purpose:  Create an image thumbnail                                        #
REM                                                                            #
REM Args:     quality is jpeg compression quality (0-100)                      #
REM           rotate is degrees to rotate                                      #
REM           size is maximum dimension of thumbnail                           #
REM           width forces thumbnail width=size                                #
REM           height forces thumbnail height=size                              #
REM           file is image to process                                         #
REM                                                                            #
REM Notes:    Suggested -size values:                                          #
REM           1600  1440  1200  1000  800  640  480  400  320  240  200  160   #
REM           1200  1080   900   750  600  480  360  300  240  180  150  120   #
REM                                                                            #
REM Requires: convert                                                          #
REM                                                                            #
REM Returns:  Creates image file named thumb_* in current directory            #
REM                                                                            #
REM ############################################################################

rem Pop args until file=%1
set quality=90
set rotate=0
set size=800
set dimension=either
:STARTLOOP
if [%2]==[] goto ENDLOOP
if %1==-quality set quality=%2 &      shift & shift
if %1==-rotate set rotate=%2 &        shift & shift
if %1==-size set size=%2&             shift & shift
rem     space-sensitive ^
if %1==-width set dimension=width &   shift
if %1==-height set dimension=height & shift
goto STARTLOOP
:ENDLOOP

set convert=%gnu%/graphics/imagick/convert
set thumbfile="%~dpn1_%size%%~x1"
goto %dimension%

:EITHER
%convert% -quality %quality% -size %size%x%size% -resize %size%x%size%^
 -rotate %rotate% %1 %thumbfile% & goto EOF
goto EOF

:WIDTH
%convert% -quality %quality% -size %size%        -resize %size%^
 -rotate %rotate% %1 %thumbfile% & goto EOF

:HEIGHT
%convert% -quality %quality% -size       x%size% -resize       x%size%^
 -rotate %rotate% %1 %thumbfile% & goto EOF

:HELP
echo Usage: thumb [-quality=90 -rotate=0 -size=800 -width -height] file
echo.
echo Suggested -size values:
echo 1600  1440  1200  1000  800  640  480  400  320  240  200  160
echo 1200  1080   900   750  600  480  360  300  240  180  150  120
echo.

:EOF
