@echo off
setlocal
REM ####################################################################################################################
REM                                                                                                                    #
REM Script:   ll [options] [file]                                                                                      #
REM                                                                                                                    #
REM Purpose:  List files in long format                                                                                #
REM                                                                                                                    #
REM Args:     See ls documentation                                                                                     #
REM                                                                                                                    #
REM Requires: ls                                                                                                       #
REM                                                                                                                    #
REM Returns:  ls is run                                                                                                #
REM                                                                                                                    #
REM ####################################################################################################################

rem long, no_group, no_owner
ls -lGg %LS_OPTIONS% %*
