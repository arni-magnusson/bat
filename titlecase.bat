@echo off
setlocal
REM ############################################################################
REM                                                                            #
REM Script:  titlecase                                                         #
REM                                                                            #
REM Purpose: Provide  for Emacs `titlecase-dwim'                               #
REM                                                                            #
REM Returns: Converts text to titlecase                                        #
REM                                                                            #
REM ############################################################################

perl %gnu%/titlecase/titlecase %*
