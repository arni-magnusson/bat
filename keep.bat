@echo off
setlocal
if [%1]==[] goto HELP
if [%1]==[--help] goto HELP
REM ############################################################################
REM                                                                            #
REM Script:  keep [-x] file(s)                                                 #
REM                                                                            #
REM Purpose: Remove all files in current directory, except those specified     #
REM                                                                            #
REM Args:    -x confirms the removal (default is to report files that would be #
REM             removed)                                                       #
REM                                                                            #
REM Notes:   Directories, links, and hidden files are not removed, as a safety #
REM            cap                                                             #
REM                                                                            #
REM Returns: Removes files in current directory                                #
REM                                                                            #
REM ############################################################################

set sure=no
if %1==-x set sure=yes & shift

rem 1  Move kept files (and directories) into tempdir
set tempdir=%temp%\keep
rd /q /s %tempdir% 2> NUL
md %tempdir%
mv %1 %2 %3 %4 %5 %6 %7 %8 %9 %tempdir%

rem 2  Remove remaining files (suppressing directory warnings) or report them
if %sure%==yes (del /Q *) else (dir /B/A-D)

rem 3  Bring back kept files and remove tempdir
xcopy /S /Y %tempdir%\* > NUL
rd /q /s %tempdir%

goto EOF

:HELP
echo Usage: keep [-x] file(s)
echo.

:EOF
