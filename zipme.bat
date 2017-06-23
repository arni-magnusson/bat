@echo off
setlocal
if [%1]==[] goto HELP
if [%1]==[--help] goto HELP
REM ####################################################################################################################
REM                                                                                                                    #
REM Script:   zipme [-b] [-g] [-x] file                                                                                #
REM                                                                                                                    #
REM Purpose:  Zip file or directory to 7Z, BZ2, GZ, TAR.BZ2, TAR.GZ, XZ, or ZIP (default) format                       #
REM                                                                                                                    #
REM Args:     b creates BZ2 or TAR.BZ2 file                                                                            #
REM           g creates GZ or TAR.GZ file                                                                              #
REM           x creates XZ or TAR.XZ file                                                                              #
REM           file is file or directory to zip                                                                         #
REM                                                                                                                    #
REM Requires: bzip2, gzip, tar, xz, zip                                                                                #
REM                                                                                                                    #
REM Returns:  Creates zipped file with same prefix in current directory                                                #
REM                                                                                                                    #
REM ####################################################################################################################

rem Pop args until file=%1
set method=zip
:STARTLOOP
if [%2]==[] goto ENDLOOP
if %1==-b set method=bzip2 & shift
if %1==-g set method=gzip  & shift
if %1==-x set method=xz    & shift
goto STARTLOOP
:ENDLOOP

rem Find out whether 'file' is file or directory
set type=%~a1
goto %type:~0,1%

rem File
:-
if %method%==bzip2 bzip2 -k              %1 & goto EOF
if %method%==gzip  gzip  -c %1>"%~1.gz"     & goto EOF
if %method%==xz    xz    -k              %1 & goto EOF
if %method%==zip   zip   -q "%~dpn1.zip" %1 & goto EOF

rem Directory
:d
if %method%==bzip2 tar -cjf "%~1.tar.bz2" %1 & goto EOF
if %method%==gzip  tar -czf "%~1.tar.gz"  %1 & goto EOF
if %method%==xz    tar -cJf "%~1.tar.xz"  %1 & goto EOF
if %method%==zip   zip -qr  "%~1.zip"     %1 & goto EOF

:HELP
echo Usage: zipme [-b] [-g] [-x] file
echo.

:EOF
