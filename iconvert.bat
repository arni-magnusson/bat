@echo off
setlocal
REM ############################################################################
REM                                                                            #
REM Script:   iconvert [options] from to                                       #
REM                                                                            #
REM Purpose:  Convert between image formats without typing                     #
REM             %gnu%/graphics/imagick/convert                                 #
REM                                                                            #
REM Args:     See %gnu%/graphics/imagick/convert --help                        #
REM                                                                            #
REM Requires: convert                                                          #
REM                                                                            #
REM Returns:  Creates image file with same prefix in current directory         #
REM                                                                            #
REM ############################################################################

%gnu%/graphics/imagick/convert %*
