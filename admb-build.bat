@echo off
rem setglobal
REM ####################################################################################################################
REM                                                                                                                    #
REM Script:   admb-build                                                                                               #
REM                                                                                                                    #
REM Purpose:  Disable RTOOLS and MSYS in path, e.g. before building ADMB                                               #
REM                                                                                                                    #
REM Returns:  Path is changed                                                                                          #
REM                                                                                                                    #
REM ####################################################################################################################

REM 1  Store desired path in a file
set newpath=%temp%\newpath.txt
echo %path%| sed s/RTOOLS/XXXXXX/g;s/MSYS/XXXX/g;s/GIT/XXX/g > %newpath%

REM 2  Set path by reading from file
for /F "usebackq tokens=*" %%F in (%newpath%) do set path=%%F
del %newpath%

REM 3  Report new path
path
