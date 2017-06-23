@echo off
setlocal
if [%1]==[--help] goto HELP
REM ############################################################################
REM                                                                            #
REM Script:   emacs [options] [file]                                           #
REM                                                                            #
REM Purpose:  Open Emacs without hanging up parent process                     #
REM                                                                            #
REM Args:     See Emacs documentation                                          #
REM                                                                            #
REM Notes:    Used in the command line, so emacs.bat needs to be before        #
REM             emacs.exe in the path                                          #
REM           Luckily, R options(editor="emacs") runs emacs.exe, not           #
REM             emacs.bat, so fix(function) updates code                       #
REM                                                                            #
REM Requires: emacs, runemacs                                                  #
REM                                                                            #
REM Returns:  Emacs is started                                                 #
REM                                                                            #
REM ############################################################################

set nw=0
for %%A in (%*) do if %%A==-nw set nw=1

if %nw%==0 (runemacs %*) else (emacs.exe %*)

goto EOF

:HELP
emacs.exe --help

:EOF
