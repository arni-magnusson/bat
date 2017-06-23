        @echo off
setlocal
REM ############################################################################
REM                                                                            #
REM Script:   lld                                                              #
REM                                                                            #
REM Purpose:  List directories only                                            #
REM                                                                            #
REM Args:     See ls documentation                                             #
REM                                                                            #
REM Requires: ls                                                               #
REM                                                                            #
REM Returns:  ls is run                                                        #
REM                                                                            #
REM ############################################################################

rem dir_names, long, no_group, no_owner, remove_slash
ls -dlGg %LS_OPTIONS% --color=always */ | sed "s/\///g"
