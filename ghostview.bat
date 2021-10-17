@echo off
setlocal
REM ############################################################################
REM                                                                            #
REM Script:   ghostview [options] [file]                                       #
REM                                                                            #
REM Purpose:  Start PS/PDF viewer from Emacs                                   #
REM                                                                            #
REM Returns:  PS/PDF viewer is started                                         #
REM                                                                            #
REM ############################################################################

set sumatra=%gnu%/sumatra/sumatra
%sumatra% %*
