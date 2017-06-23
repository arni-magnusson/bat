@echo off
setlocal
if [%1]==[--help] goto HELP
REM ####################################################################################################################
REM                                                                                                                    #
REM Script:   size [-b] [-d=maxdepth] [-k] [-m] dir                                                                    #
REM                                                                                                                    #
REM Purpose:  Show directory size                                                                                      #
REM                                                                                                                    #
REM Args:     b shows size in bytes (default is human-readable)                                                        #
REM           maxdepth is how many levels of subdirectories should be recursed into (default is 0)                     #
REM           k shows size in kilobytes (default is human-readable)                                                    #
REM           m shows size in megabytes (default is human-readable)                                                    #
REM           dir is a directory whose size should be shown                                                            #
REM                                                                                                                    #
REM Notes:    All values are rounded up                                                                                #
REM                                                                                                                    #
REM Returns:  Directory size is shown on screen                                                                        #
REM                                                                                                                    #
REM ####################################################################################################################

rem Pop all args starting with hyphen, until either (1) no args remain or (2) %1 is the 'dir' arg
set units=-bh
:STARTLOOP
if [%1]==[] goto ENDLOOP
set arg=%1
if %arg:~0,1% NEQ - goto ENDLOOP
if %1==-b set units=-b &  shift
if [%1]==[] goto ENDLOOP
if %1==-d set depth=%2 &  shift & shift
if [%1]==[] goto ENDLOOP
if %1==-k set units=-bk & shift
if [%1]==[] goto ENDLOOP
if %1==-m set units=-bm & shift
goto STARTLOOP
:ENDLOOP

if [%1]==[] (goto NODIR) else (goto DIR)

:DIR
rem Default depth=0 if user passes 'dir'
if not defined depth set depth=0
du %units% --max-depth=%depth% %1         & goto EOF

:NODIR
rem Default depth=1 if user passes no 'dir', shave off last line
if not defined depth set depth=1
du %units% --max-depth=%depth%            & goto EOF

:HELP
echo Usage: size [-b] [-d=maxdepth] [-k] [-m] dir
echo             bytes               KB   MB

:EOF
