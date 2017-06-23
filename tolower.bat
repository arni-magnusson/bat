@echo off
setlocal
if [%1]==[] goto HELP
if [%1]==[--help] goto HELP
REM ####################################################################################################################
REM                                                                                                                    #
REM Batch:    tolower [-f] file(s)                                                                                     #
REM                                                                                                                    #
REM Purpose:  Rename directories and files to lowercase                                                                #
REM                                                                                                                    #
REM Args:     f only renames files, not subdirectories                                                                 #
REM           file is a directory whose contents should be renamed, or file(s) that should be renamed (max 9 files)    #
REM                                                                                                                    #
REM Notes:    If 'file' is a directory, its contents are renamed recursively                                           #
REM                                                                                                                    #
REM Requires: sed                                                                                                      #
REM                                                                                                                    #
REM Returns:  File or directory contents are renamed to lowercase                                                      #
REM                                                                                                                    #
REM ####################################################################################################################

rem Allow many file args and use recursion to handle dirs in a special way (can't use %* because includes shifted -f)
set dirargs=/B/L
set userargs=
if %1==-f set dirargs=/A-D/B/L& set userargs=%userargs% -f& shift
if [%2] NEQ [] call tolower.bat %userargs% %2 %3 %4 %5 %6 %7 %8 %9

if not exist %1 echo File not found & goto EOF

rem If %1 is a directory, append /S to recurse into directories
set type=%~a1
if %type:~0,1%==d set dirargs=%dirargs%/S

set upper=ABCDEFGHIJKLMNOPQRSTUVWXYZ
set lower=abcdefghijklmnopqrstuvwxyz

rem 1  If %1 is a directory and user did not pass -f, make sure it is renamed (not only its contents)
echo %1>%TEMP%\main.txt
for /F "usebackq tokens=*" %%X in (`sed "y/%upper%/%lower%/" %TEMP%\main.txt`) do echo ren "%%X" "%%X">%TEMP%\rename.txt
if [%userargs%]==[-f] del %TEMP%\rename.txt

rem 2  Write draft of rename commands (ren "path" "path") to temp.txt
for /F "usebackq tokens=*" %%X in (`dir %dirargs% %1`) do echo ren "%%X" "%%X">>%TEMP%\rename.txt

rem 3  Edit second "path" to basename
sed "s/\" \".*\\\/\" \"/g" %TEMP%\rename.txt>%TEMP%\rename.bat

rem 4  Run commands and cleanup
call %TEMP%\rename.bat
del %TEMP%\main.txt %TEMP%\rename.txt %TEMP%\rename.bat
goto EOF

:HELP
echo Usage: tolower [-f] file(s)
echo.
echo -f only renames files, not directories
echo.

:EOF
