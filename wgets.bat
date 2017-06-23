@echo off
setlocal
REM ####################################################################################################################
REM                                                                                                                    #
REM Script:  wgets                                                                                                     #
REM                                                                                                                    #
REM Purpose: Download URL insecurely without typing wget --no-check-certificate                                        #
REM                                                                                                                    #
REM Returns: Downloads file from web to current directory                                                              #
REM                                                                                                                    #
REM ####################################################################################################################

wget --no-check-certificate %*
