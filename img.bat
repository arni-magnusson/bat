@echo off
setlocal
if [%1]==[] goto HELP
if [%1]==[--help] goto HELP
REM ############################################################################
REM                                                                            #
REM Script:   img [-u] file                                                    #
REM                                                                            #
REM Purpose:  Show bitmap attributes: width, height, depth, colorspace, bytes  #
REM                                                                            #
REM Args:     u calculates unique colors (expensive)                           #
REM           file is the file(s) to analyze                                   #
REM                                                                            #
REM Notes:    Multipage files have page-specific attributes shown in a very    #
REM             long line, consider 'identify' for those                       #
REM           PDF and EPS files are analyzed as if they had been converted to  #
REM             TIF (many bytes etc.)                                          #
REM                                                                            #
REM Requires: identify                                                         #
REM                                                                            #
REM Returns:  Image attributes are shown                                       #
REM                                                                            #
REM ############################################################################

rem Allow multiple file args
set format="%%f %%wx%%h %%q-bit %%r [%%b bytes]\n"
if %1==-u set format="%%f %%wx%%h %%q-bit %%r in %%k colors [%%b bytes]\n"&^
 shift

rem Loop so that wildcards (*.jpg) are expanded and output will have \n between^
rem files, but not after last file
for /F "usebackq tokens=*" %%F in (`dir /b %1`) do^
 identify -format %format% "%%F"

goto EOF

:HELP
echo Usage: img [-u] file
echo.
echo   -u  calculate unique colors (expensive)
echo.

:EOF
