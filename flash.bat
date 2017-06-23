@echo off
setlocal
if [%1]==[] goto HELP
if [%1]==[--help] goto HELP
REM ####################################################################################################################
REM                                                                                                                    #
REM Script:   flash file                                                                                               #
REM                                                                                                                    #
REM Purpose:  Play FLV movie in web browser                                                                            #
REM                                                                                                                    #
REM Args:     file is the FLV movie to play                                                                            #
REM                                                                                                                    #
REM Notes:    MPlayer version 1.0rc2 and later can play FLV movies, but I keep this script mainly as a reference on    #
REM             how to run local javascript on a local file                                                            #
REM                                                                                                                    #
REM Requires: player.swf, swfobject2.js                                                                                #
REM                                                                                                                    #
REM Returns:  Web browser is opened with movie playing                                                                 #
REM                                                                                                                    #
REM ####################################################################################################################

set echo=%gnu%/shell/rtools/echo
set html=%temp%\flash.html

type nul > %html%
%echo% "<body style='background-color:black;margin:0'>"                                          >> %html%
%echo% "<p id='player' style='text-align:center;margin:0'>"                                      >> %html%
%echo% "<script type='text/javascript' src='file:///%gnu%/media/flash/swfobject2.js'></script>"  >> %html%
%echo% "<script type='text/javascript'>"                                                         >> %html%
%echo% "var so = new SWFObject('file:///%gnu%/media/flash/player.swf','','794','616')"           >> %html%
%echo% "so.addParam('allowfullscreen','true')"                                                   >> %html%
%echo% "so.addVariable('fullscreen','true')"                                                     >> %html%
%echo% "so.addVariable('showdigits','false')"                                                    >> %html%
%echo% "so.addVariable('autostart', 'true')"                                                     >> %html%

set filename=%~f1
set filename=%filename:\=/%
%echo% "so.addVariable('file', 'file:///%filename%')"                                            >> %html%

%echo% "so.write('player')"                                                                      >> %html%
%echo% "</script>"                                                                               >> %html%

%html%

del %html%

goto EOF

:HELP
echo Usage: flash file
echo.

:EOF
