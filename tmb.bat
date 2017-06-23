@echo off
setlocal
REM ############################################################################
REM                                                                            #
REM Script:   tmb [options] [file]                                             #
REM                                                                            #
REM Purpose:  Open Emacs -Q in tmb-mode, with ESS in load-path                 #
REM                                                                            #
REM Args:     See Emacs documentation                                          #
REM                                                                            #
REM Notes:    Used in the development of tmb-mode, to emulate user experience  #
REM             without any .emacs settings                                    #
REM                                                                            #
REM Requires: runemacs, ess, tmb-mode                                          #
REM                                                                            #
REM Returns:  Emacs is started                                                 #
REM                                                                            #
REM ############################################################################

runemacs -Q -mm^
 --eval "(setq initial-scratch-message nil)"^
 --eval "(add-to-list 'load-path \"~/emacs/lisp/ess/lisp\")"^
 --load ~/emacs/lisp/tmb/tmb.el^
 -f tmb-mode
