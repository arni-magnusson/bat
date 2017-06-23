@echo off
setlocal
REM ############################################################################
REM                                                                            #
REM Script:   gs [options] file1 [file2 ...]                                   #
REM                                                                            #
REM Purpose:  Start Ghostscript using the platform-independent 'gs'            #
REM                                                                            #
REM Args:     See Ghostscript documentation                                    #
REM                                                                            #
REM Notes:    Implemented for eps2pdf()                                        #
REM                                                                            #
REM Requires: gswin32c                                                         #
REM                                                                            #
REM Returns:  Ghostscript is started                                           #
REM                                                                            #
REM ############################################################################

gswin32c %*
