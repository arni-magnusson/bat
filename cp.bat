@echo off
setlocal
REM ############################################################################
REM                                                                            #
REM Batch:    cp [options] source dest                                         #
REM                                                                            #
REM Purpose:  Run cp without modifying time attributes                         #
REM                                                                            #
REM Args:     See cp documentation                                             #
REM                                                                            #
REM Notes:    This cp.bat needs to be before cp.exe in the path                #
REM                                                                            #
REM Requires: cp                                                               #
REM                                                                            #
REM Returns:  Copies file(s)                                                   #
REM                                                                            #
REM ############################################################################

cp.exe -p %*
