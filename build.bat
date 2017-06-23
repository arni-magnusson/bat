@echo off
setlocal
if [%1]==[] goto HELP
if [%1]==[--help] goto HELP
REM ####################################################################################################################
REM                                                                                                                    #
REM Script:   build file.cpp                                                                                           #
REM                                                                                                                    #
REM Purpose:  Build simple C++ program (one source file)                                                               #
REM                                                                                                                    #
REM Args:     file is a C++ source code file                                                                           #
REM                                                                                                                    #
REM Requires: g++                                                                                                      #
REM                                                                                                                    #
REM Returns:  Creates executable file with same prefix in current directory                                            #
REM                                                                                                                    #
REM ####################################################################################################################

set exe="%~dpn1"
g++ -s -static -Wall %1 -o %exe%
goto EOF

:HELP
echo Usage: build file.cpp
echo.

:EOF
