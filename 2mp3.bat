@echo off
setlocal
if [%1]==[] goto HELP
if [%1]==[--help] goto HELP
REM ####################################################################################################################
REM                                                                                                                    #
REM Script:   2mp3 [-b=n] [-V=0] file                                                                                  #
REM                                                                                                                    #
REM Purpose:  Convert WAV or WMA file to MP3 format                                                                    #
REM                                                                                                                    #
REM Args:     b is constant bitrate                                                                                    #
REM           V is variable bitrate (default 0)                                                                        #
REM           file is file to convert                                                                                  #
REM                                                                                                                    #
REM Requires: lame, mplayer                                                                                            #
REM                                                                                                                    #
REM Returns:  Creates MP3 file with same prefix in current directory                                                   #
REM                                                                                                                    #
REM ####################################################################################################################

rem Pop args until file=%1
set lameargs=-V 0
:STARTLOOP
if [%2]==[] goto ENDLOOP
if %1==-V set lameargs=-V %2& shift & shift
if %1==-b set lameargs=-b %2& shift & shift
goto STARTLOOP
:ENDLOOP

set lameargs=%lameargs% -h
set mp3="%~dpn1.mp3"
set wav="%~dpn1.wav"
rem len is the wav filename length, required by mplayer
for /F "usebackq tokens=*" %%X in (`expr length %wav%`) do set len=%%X

goto %~x1

:.WAV
lame %lameargs% %1 %mp3%                             & goto EOF

:.WMA
mplayer %mplayerargs% -ao pcm:file=%%%len%%%%wav% %1
lame %lameargs% %wav% %mp3%
del %wav%                                            & goto EOF

:HELP
echo Usage: 2mp3 [-b=n] [-V=0] file
echo.
echo b:constant bitrate, V:variable bitrate (0:high quality, 9:low)
echo.

:EOF
