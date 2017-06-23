@echo off
setlocal
if [%1]==[] goto HELP
if [%1]==[--help] goto HELP
REM ############################################################################
REM                                                                            #
REM Script:   rotate [-b] [-q] file                                            #
REM                                                                            #
REM Purpose:  Rotate photo according to its 'Orientation' EXIF tag             #
REM                                                                            #
REM Args:     b creates backup(s) *.original in same directory (otherwise a    #
REM             backup is created in the TEMP folder)                          #
REM           q suppresses progress report                                     #
REM           file is the file(s) to rotate, or directory containing photos    #
REM                                                                            #
REM Notes:    Photos with Orientation 3/6/8 are rotated and their Orientation  #
REM             set to 1, others are skipped                                   #
REM           This script is for JPG images with EXIF data, whose width and    #
REM             height are divisible by 16                                     #
REM           Older cameras record Orientation=1 for all photos, these must be #
REM             rotated by hand (see jpgrot.bat)                               #
REM           Wildcards must start with * (*.jpg, *2008.jpg), midstring        #
REM             wildcards are not supported (2008*.jpg)                        #
REM                                                                            #
REM Warning:  Overwrites original file                                         #
REM                                                                            #
REM Requires: exiftool, jpegexiforient, jpegtran, touch                        #
REM                                                                            #
REM Returns:  Image is rotated and EXIF tag updated                            #
REM                                                                            #
REM ############################################################################

rem Allow many file args and use recursion to handle dirs in a special way
rem (can't use %* because includes shifted -b -q)
set backup=0
set quiet=0
set userargs=
if %1==-b set backup=1 & set userargs=%userargs% -b& shift
if %1==-q set quiet=1 & set userargs=%userargs% -q& shift
if [%2] NEQ [] call rotate.bat %userargs% %2 %3 %4 %5 %6 %7 %8 %9

if not exist %1 (if %quiet%==0 echo %1: not found) & goto EOF

rem If %1 is a directory, recurse
set type=%~a1
if %type:~0,1%==d for /F "usebackq tokens=*" %%X in (`dir A-D/B/S %1`) do^
 call rotate.bat %userargs% %%X
if %type:~0,1%==d goto EOF

rem If %1 starts with *, recurse
set filename=%1
if %filename:~0,1%==* for /F "usebackq tokens=*" %%X in (`dir /B %1`) do^
 call rotate.bat %userargs% %%X
if %filename:~0,1%==* goto EOF

rem If %1 does is neither jpg nor jpeg, skip it
if %filename:~-4% NEQ .jpg if %filename:~-4% NEQ .JPG echo %1: not a jpg &^
 goto EOF

rem %1 is a single valid filename ______________________________________________

set deg=0
set tempfile=%temp%\temp.jpg

rem 1  Backup original file
if %backup%==1 (copy %1 %~dpn1.original > nul)^
 else (copy %1 %temp%\backup.jpg > nul)

rem 2  Find out current orientation
for /F "usebackq tokens=*" %%X in (`jpegexiforient -n %1`) do set orient=%%X

rem 3  Find out appropriate degrees
if [%orient%]==[3] set deg=180
if [%orient%]==[6] set deg=90
if [%orient%]==[8] set deg=270
if %deg%==0 (if %quiet%==0 echo %1: skipped) & goto EOF

rem 4  Rotate, tag, touch, move
jpegtran -copy all -rotate %deg% %1>%tempfile%
call exiftool.bat -Orientation=1 -n -overwrite_original -q %tempfile%
touch -r %1 %tempfile%
move %tempfile% %1
if %quiet%==0 echo %1: rotated %deg% degrees

goto EOF

:HELP
echo Usage: rotate [-b] [-q] file
echo.
echo  -b  create backup(s) in same directory
echo  -q  suppress progress report
echo.

:EOF
