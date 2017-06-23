@echo off
setlocal
if [%1]==[] goto HELP
if [%1]==[--help] goto HELP
REM ####################################################################################################################
REM                                                                                                                    #
REM Script:   save run.txt                                                                                             #
REM                                                                                                                    #
REM Purpose:  Rename Coleraine (cod40) output files                                                                    #
REM                                                                                                                    #
REM Args:     input.txt is a Coleraine input file                                                                      #
REM                                                                                                                    #
REM Requires: *.cor, ref.dat, results.dat                                                                              #
REM                                                                                                                    #
REM Returns:  Renames to *.cor, *.ref, *.res                                                                           #
REM                                                                                                                    #
REM ####################################################################################################################

set run=%~n1

move cod*.cor    %run%.cor > NUL
move ref.dat     %run%.ref
move results.dat %run%.res

goto EOF

:HELP
echo Usage: save run.txt
echo.

:EOF
