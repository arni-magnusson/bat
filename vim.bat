@echo off
setlocal
REM ############################################################################
REM                                                                            #
REM Script:   vim [options] [file]                                             #
REM                                                                            #
REM Purpose:  Start Vim in easy mode without insertmode                        #
REM                                                                            #
REM Args:     See Vim documentation                                            #
REM                                                                            #
REM Notes:    Easy mode provides Windows C-key bindings                        #
REM           I would maintain identical evim.bat/gvim.bat/vi.bat scripts if I #
REM             used the editor                                                #
REM                                                                            #
REM Requires: gvim                                                             #
REM                                                                            #
REM Returns:  Vim is started                                                   #
REM                                                                            #
REM ############################################################################

%gnu%/text/vim/gvim -y -c "set noinsertmode" %*
