@echo off
setlocal
REM ####################################################################################################################
REM                                                                                                                    #
REM Script:   la [options] [file]                                                                                      #
REM                                                                                                                    #
REM Purpose:  List all files                                                                                           #
REM                                                                                                                    #
REM Args:     See ls documentation                                                                                     #
REM                                                                                                                    #
REM Requires: ls                                                                                                       #
REM                                                                                                                    #
REM Returns:  ls is run                                                                                                #
REM                                                                                                                    #
REM ####################################################################################################################

rem all
ls -a %LS_OPTIONS% %*
