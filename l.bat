@echo off
setlocal
REM ############################################################################
REM                                                                            #
REM Script:   l [options] [file]                                               #
REM                                                                            #
REM Purpose:  List files                                                       #
REM                                                                            #
REM Args:     See ls documentation                                             #
REM                                                                            #
REM Requires: ls                                                               #
REM                                                                            #
REM Returns:  ls is run                                                        #
REM                                                                            #
REM ############################################################################

ls %LS_OPTIONS% %*
