@echo off
setlocal
if [%1]==[] goto HELP
if [%1]==[--help] goto HELP
REM ############################################################################
REM                                                                            #
REM Script:   ifind "glob"                                                     #
REM                                                                            #
REM Purpose:  Find files without typing %gnu%/shell/unxutils/ and -iname       #
REM                                                                            #
REM Args:     glob is the filename pattern to look for (case-insensitive,      #
REM             possibly containing *)                                         #
REM                                                                            #
REM Requires: find                                                             #
REM                                                                            #
REM Returns:  Matching filenames                                               #
REM                                                                            #
REM ############################################################################

rem If one arg, look for that filename, otherwise pass args to find
if [%2]==[] (set findargs=-iname %1) else (set findargs=%*)

rem Old "unxutils" version 4.1 can search in ~/emacs/backup,
rem but "gnuwin32" or "rtools" can't
set find=%gnu%/shell/unxutils/find
%find% %findargs%
goto EOF

:HELP
echo Usage: ifind "glob"
echo.

:EOF
