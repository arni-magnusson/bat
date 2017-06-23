@echo off
setlocal
REM ############################################################################
REM                                                                            #
REM Script:   emacsR [options] [file]                                          #
REM                                                                            #
REM Purpose:  Open Emacs in R-mode, without typing C-c r after startup         #
REM                                                                            #
REM Args:     See Emacs documentation                                          #
REM                                                                            #
REM Notes:    Used in the command line, but not in Rgui or ESS since           #
REM             fix(function) would not update (use emacs in R)                #
REM                                                                            #
REM Requires: runemacs                                                         #
REM                                                                            #
REM Returns:  Emacs is started                                                 #
REM                                                                            #
REM ############################################################################

rem               /    if filename is passed    \          /no file\
runemacs --eval "(setq default-major-mode 'R-mode)" --eval "(R-mode)" %*
