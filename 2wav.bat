@echo off
setlocal
if [%1]==[] goto HELP
if [%1]==[--help] goto HELP
REM ####################################################################################################################
REM                                                                                                                    #
REM Script:   2wav [-mono] file                                                                                        #
REM                                                                                                                    #
REM Purpose:  Convert MP3 file to WAV format                                                                           #
REM                                                                                                                    #
REM Args:     mono forces single-channel (wav->wav)                                                                    #
REM           file is file to convert                                                                                  #
REM                                                                                                                    #
REM Requires: lame, mplayer                                                                                            #
REM                                                                                                                    #
REM Returns:  Creates WAV file with same prefix in current directory                                                   #
REM                                                                                                                    #
REM ####################################################################################################################

rem Pop args until file=%1
set mplayerargs=
:STARTLOOP
if [%2]==[] goto ENDLOOP
if %1==-mono set mplayerargs=-channels 1 & shift
goto STARTLOOP
:ENDLOOP

set lameargs=--decode
set wav="%~dpn1.wav"
set pcm=%temp%\temp.pcm
rem len is the wav filename length, required by mplayer
for /F "usebackq tokens=*" %%X in (`expr length %wav%`) do set len=%%X

goto %~x1

:.M4A
:.WMA
mplayer %mplayerargs% -ao pcm:file=%%%len%%%%wav% %1 & goto EOF

:.MP3
lame %lameargs% %1 %wav%                             & goto EOF

:.OGG
%gnu%/media/vorbis/oggdec %1                         & goto EOF

:.WAV
mplayer %mplayerargs% -ao pcm:file=%%%len%%%%wav% %1
move /y %pcm% %1                                     & goto EOF

:HELP
echo Usage: 2wav [-mono] file
echo.

:EOF
