@echo off
setlocal
if [%1]==[] goto HELP
if [%1]==[--help] goto HELP
REM ############################################################################
REM                                                                            #
REM Batch:    tighten [-h] [-m=3] [-x] file                                    #
REM                                                                            #
REM Purpose:  Tighten bounding box of EPS file                                 #
REM                                                                            #
REM Args:     h changes HiResBoundingBox instead of BoundingBox                #
REM           m is the margin, points between ink and edge of page             #
REM           x removes HiResBoundingBox, or BoundingBox if -h                 #
REM           file is EPS file to tighten                                      #
REM                                                                            #
REM Notes:    Similar to epstool -b --copy --quiet "%1" out.eps, but with      #
REM             margins                                                        #
REM           Writes backup tighten.eps in %temp%                              #
REM                                                                            #
REM Requires: gswin32c, gawk, sed                                              #
REM                                                                            #
REM Returns:  Overwrites EPS file with updated bounding box                    #
REM                                                                            #
REM ############################################################################

rem Pop args until file=%1
set h=0
set m=3
set x=0
:STARTLOOP
if [%2]==[] goto ENDLOOP
if %1==-h set h=1          & shift
if %1==-m set m=%2 & shift & shift
if %1==-x set x=1          & shift
goto STARTLOOP
:ENDLOOP

set backup=%temp%\tighten.eps
set file1=%temp%\tighten1.txt
set file2=%temp%\tighten2.txt
if %h%==1 (set bb=%%HiResBoundingBox) else (set bb=%%BoundingBox)

rem 1  Calculate narrow box
gswin32c -dBATCH -dEPSCrop -dNOPAUSE -sDEVICE=bbox %1 > nul 2> %file1%

rem 2  Add margins
gawk '/%bb%/ {print "%bb%: " $2-%m% " " $3-%m% " " $4+%m% " " $5+%m%}' %file1% > %file2%
for /F "usebackq tokens=*" %%L in (%file2%) do set box=%%L

rem 3  Backup and overwrite file
copy %1 %backup%
sed -i "s/%bb%.*/%box%/g" %1
if %x%==1 if %h%==0 sed -i "/^%%%%HiResBoundingBox/d" %1
if %x%==1 if %h%==1 sed -i "/^%%%%BoundingBox/d" %1

goto EOF

:HELP
echo Usage: tighten [-h] [-m=3] [-x] file
echo.
echo   -h  change HiResBoundingBox instead of BoundingBox
echo   -m  margin in pts
echo   -x  remove HiResBoundingBox, or BoundingBox if -h
echo.

:EOF
