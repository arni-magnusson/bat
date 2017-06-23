@echo off
setlocal
REM ####################################################################################################################
REM                                                                                                                    #
REM Script:   lynx                                                                                                     #
REM                                                                                                                    #
REM Purpose:  Start Lynx browser                                                                                       #
REM                                                                                                                    #
REM Notes:    lynx.cfg is Windows-specific (%gnu%/internet/firefox/res/hiddenwindow.html), so don't use it as ~/.lynx  #
REM                                                                                                                    #
REM Requires: lynx (not in global path)                                                                                #
REM                                                                                                                    #
REM Warning:  Due to lynx's eccentric behaviour, its path should not be global                                         #
REM                                                                                                                    #
REM Returns:  Opens shell window with Lynx browser                                                                     #
REM                                                                                                                    #
REM ####################################################################################################################

set lynx=%gnu%/internet/lynx/lynx
set lynxargs=-cfg=%gnu%/internet/lynx/lynx.cfg -nocolor %*

%lynx% %lynxargs%
