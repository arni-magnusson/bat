@echo off
setlocal
if [%1]==[] goto HELP
if [%1]==[--help] goto HELP
REM ####################################################################################################################
REM                                                                                                                    #
REM Batch:    unzipme [-asis] file                                                                                     #
REM                                                                                                                    #
REM Purpose:  Unzip 7Z, BZ2, GZ, LZMA, RAR, TAR, Z, XZ, or ZIP file                                                    #
REM                                                                                                                    #
REM Args:     asis means unzip in current directory "as is", not creating a new directory for the output               #
REM           file is file to unzip                                                                                    #
REM                                                                                                                    #
REM Notes:    If filename includes ampersand &, a needless warning is shown and can be ignored                         #
REM                                                                                                                    #
REM Requires: 7za, bunzip2, compress, gawk, gunzip, lzma, tar, unrar, unzip, xz                                        #
REM                                                                                                                    #
REM Returns:  Creates unzipped files in current directory, or new directory if archive contains many file/dirs         #
REM                                                                                                                    #
REM ####################################################################################################################

rem Pop args until file=%1
set asis=0
:STARTLOOP
if [%2]==[] goto ENDLOOP
if %1==-asis set asis=1 & shift
goto STARTLOOP
:ENDLOOP

set lines=%temp%\lines
set tar=tar -k --no-same-owner

rem Check double file endings first (%~1 to remove possible quotes)
set I=%~1
set I=%I:\=/%
if "%I:~-7%"==".tar.7z"   goto .TAR.7Z
if "%I:~-7%"==".tar.gz"   goto .TAR.GZ
if "%I:~-7%"==".tar.xz"   goto .TAR.XZ
if "%I:~-8%"==".tar.bz2"  goto .TAR.BZ2
if "%I:~-9%"==".tar.lzma" goto .TAR.LZMA
goto %~x1

rem IF asis THEN unzip here
rem IF one file or one dir THEN unzip here ELSE unzip into new dir

:.7Z
if %asis%==1 7za x %1 & goto EOF
7za l %1 | sed -n "/^[1-2]/p" | cut -c54- | gawk -F\ "{print $1}" | uniq | wc -l > %lines%
for /F "usebackq tokens=*" %%L in ("%lines%") do set unique=%%L
if %unique%==1 (7za x %1 & goto EOF) else (7za x -o"%~dpn1" %1                                & goto EOF)

:.BZ2
bunzip2 -k %1                                                                                 & goto EOF

:.GZ
gunzip -c %1>"%~dpn1"                                                                         & goto EOF

:.LZMA
lzma -dk %1                                                                                   & goto EOF

:.RAR
if %asis%==1 unrar x %1 & goto EOF
unrar lb %1 | sed "s/^\.\///" | gawk -F/ "{print $1}" | uniq | wc -l > %lines%
for /F "usebackq tokens=*" %%L in ("%lines%") do set unique=%%L
if %unique%==1 (unrar x %1 & goto EOF) else (unrar x -ad %1                                   & goto EOF)

:.TAR
if %asis%==1 %tar% -xf %1 & goto EOF
%tar% -tf %1 | sed "s/^\.\///" | gawk -F/ "{print $1}" | uniq | wc -l > %lines%
for /F "usebackq tokens=*" %%L in ("%lines%") do set unique=%%L
if %unique%==1 (%tar% -xf  %1 & goto EOF) else (md "%I:~0,-4%" & %tar% -C "%I:~0,-4%" -xf %1  & goto EOF)

:.TAR.BZ2
if %asis%==1 %tar% -xf %1 & goto EOF
%tar% -tf %1 | sed "s/^\.\///" | gawk -F/ "{print $1}" | uniq | wc -l > %lines%
for /F "usebackq tokens=*" %%L in ("%lines%") do set unique=%%L
if %unique%==1 (%tar% -xf %1 & goto EOF) else (md "%I:~0,-8%" & %tar% -C "%I:~0,-8%" -xf %1   & goto EOF)

:.TAR.GZ
if %asis%==1 %tar% -xf %1 & goto EOF
%tar% -tf %1 | sed "s/^\.\///" | gawk -F/ "{print $1}" | uniq | wc -l > %lines%
for /F "usebackq tokens=*" %%L in ("%lines%") do set unique=%%L
if %unique%==1 (%tar% -xf %1 & goto EOF) else (md "%I:~0,-7%" & %tar% -C "%I:~0,-7%" -xf %1   & goto EOF)

:.TAR.7Z
rem The 'xz' program does not recognize (some?) 7z files
if %asis%==1 7za x -so %1 | %tar% -x & goto EOF
7za x -so %1 2> NUL | %tar% -t | sed "s/^\.\///" | gawk -F/ "{print $1}" | uniq | wc -l > %lines%
for /F "usebackq tokens=*" %%L in ("%lines%") do set unique=%%L
if %unique%==1 (7za x -so %1 | %tar% -x & goto EOF) else (md "%I:~0,-7%" & 7za x -so %1 | %tar% -C "%I:~0,-7%" -x & goto EOF)

:.TAR.XZ
rem XZ format not supported in Windows tar 1.21 (Rtools)
rem     if %asis%==1 %tar% -xf %1 & goto EOF
if %asis%==1 xz -dc %1 | %tar% -x & goto EOF
rem            %tar% -tf %1 | sed "s/^\.\///" | gawk -F/ "{print $1}" | uniq | wc -l > %lines%
xz -dc %1 | %tar% -t 2> NUL | sed "s/^\.\///" | gawk -F/ "{print $1}" | uniq | wc -l > %lines%
for /F "usebackq tokens=*" %%L in ("%lines%") do set unique=%%L
rem              if %unique%==1 (%tar% -xf %1 & goto EOF) else (md "%I:~0,-7%" & %tar% -C "%I:~0,-7%" -x %1 & goto EOF)
if %unique%==1 (xz -dc %1 | %tar% -x & goto EOF) else (md "%I:~0,-7%" & xz -dc %1 | %tar% -C "%I:~0,-7%" -x & goto EOF)

:.TAR.LZMA
rem Different from :.TAR.7Z and :.TAR.XZ (%I:~0,-9% instead of %I:~0,-7%)
if %asis%==1 xz -dc %1 | %tar% -x & goto EOF
xz -dc %1 | %tar% -t 2> NUL | sed "s/^\.\///" | gawk -F/ "{print $1}" | uniq | wc -l > %lines%
for /F "usebackq tokens=*" %%L in ("%lines%") do set unique=%%L
if %unique%==1 (xz -dc %1 | %tar% -x & goto EOF) else (md "%I:~0,-9%" & xz -dc %1 | %tar% -C "%I:~0,-9%" -x & goto EOF)

:.TGZ
rem Different from :.TAR.GZ (%~dpn1 instead of %I:~0,-7%)
if %asis%==1 %tar% -xf %1 & goto EOF
%tar% -tf %1 | sed "s/^\.\///" | gawk -F/ "{print $1}" | uniq | wc -l > %lines%
for /F "usebackq tokens=*" %%L in ("%lines%") do set unique=%%L
if %unique%==1 (%tar% -xf %1 & goto EOF) else (md "%~dpn1" & %tar% -C "%~dpn1" -xf %1         & goto EOF)

:.XZ
xz -dk %1                                                                                     & goto EOF

:.Z
compress -cd %1>"%~dpn1"                                                                      & goto EOF

:.ZIP
if %asis%==1 unzip -q %1 & goto EOF
unzip -Z1 %1 | sed "s/^\.\///" | gawk -F/ "{print $1}" | uniq | wc -l > %lines%
for /F "usebackq tokens=*" %%L in ("%lines%") do set unique=%%L
if %unique%==1 (unzip -q %1 & goto EOF) else (unzip -qd "%~dpn1" %1                           & goto EOF)

:HELP
echo Usage: unzipme [-asis] file
echo.

:EOF
del %lines% 2> NUL
