@echo off
setlocal
REM ####################################################################################################################
REM                                                                                                                    #
REM Script:   arnima                                                                                                   #
REM                                                                                                                    #
REM Purpose:  Import arnima.reg entries                                                                                #
REM                                                                                                                    #
REM Requires: e:/tolvur/_other/admin/arnima.reg                                                                        #
REM                                                                                                                    #
REM Returns:  Registry entries are imported                                                                            #
REM                                                                                                                    #
REM ####################################################################################################################

set filename=e:/tolvur/_other/admin/arnima.reg

echo Importing %filename%

reg import %filename%
