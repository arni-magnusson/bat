@echo off
setlocal
REM ############################################################################
REM                                                                            #
REM Script:  nw                                                                #
REM                                                                            #
REM Purpose: Open Emacs in Dos without typing emacs -nw                        #
REM                                                                            #
REM Returns: Opens Emacs in Dos                                                #
REM                                                                            #
REM ############################################################################

call emacs.bat -nw %*
