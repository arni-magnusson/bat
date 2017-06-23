@echo off
setlocal
if [%1]==[] goto HELP
if [%1]==[--help] goto HELP
REM ####################################################################################################################
REM                                                                                                                    #
REM Script:  rforge [-e] PKG                                                                                           #
REM                                                                                                                    #
REM Purpose: Checkout R-Forge package without typing                                                                   #
REM          svn co svn+ssh://scm.r-forge.r-project.org/svnroot/PKG/pkg PKG                                            #
REM                                                                                                                    #
REM Args:    -e means export instead of checkout                                                                       #
REM          PKG is the name of an R-Forge package                                                                     #
REM                                                                                                                    #
REM Returns: Creates directory PKG, or does nothing if directory PKG exists already                                    #
REM                                                                                                                    #
REM ####################################################################################################################

rem 1  Checkout or export
set action=co
if %1==-e set action=export& shift

rem 2 See if directory exists
set pkg=%1
if exist %pkg% echo '%pkg%' exists already, checkout aborted & goto EOF

rem 3  Convert package name to lowercase
set upper=ABCDEFGHIJKLMNOPQRSTUVWXYZ
set lower=abcdefghijklmnopqrstuvwxyz
echo %pkg%>%TEMP%\pkg.txt
for /F "usebackq tokens=*" %%X in (`sed "y/%upper%/%lower%/" %TEMP%\pkg.txt`) do set pkg=%%X

rem 4  Checkout
echo on
svn %action% svn+ssh://scm.r-forge.r-project.org/svnroot/%pkg%/pkg %1
@echo off
goto EOF

:HELP
echo Usage: rforge [-e] PKG
echo.
echo   -e    export instead of checkout
echo.

:EOF
