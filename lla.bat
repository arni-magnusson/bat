@echo off
setlocal
REM ####################################################################################################################
REM                                                                                                                    #
REM Script:   lla [options] [file]                                                                                     #
REM                                                                                                                    #
REM Purpose:  List all files in long format                                                                            #
REM                                                                                                                    #
REM Args:     See ls documentation                                                                                     #
REM                                                                                                                    #
REM Requires: ls                                                                                                       #
REM                                                                                                                    #
REM Returns:  ls is run                                                                                                #
REM                                                                                                                    #
REM ####################################################################################################################

rem all, long, no_group, no_owner
ls -alGg %LS_OPTIONS% %*
