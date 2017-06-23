@echo off
setlocal
if [%1]==[--help] goto HELP
REM ############################################################################
REM                                                                            #
REM Script:   c-example example                                                #
REM                                                                            #
REM Purpose:  Copy C/C++ example directory                                     #
REM                                                                            #
REM Args:     example is a keyword like 'hello'                                #
REM                                                                            #
REM Requires: e:/tolvur/program/c/examples                                     #
REM                                                                            #
REM Returns:  Example directory is created                                     #
REM                                                                            #
REM ############################################################################

set base=e:\tolvur\program\c\examples
goto %1

:ADD
set file=%base%\r\add\add.c             & goto get
:HELLO
set file=%base%\hello\1_basic\hello.cpp & goto get
:HELLOC
set file=%base%\c\hello.c               & goto get

:GET
rd /s /q %1 2> nul
md %1
copy %file% %1 > nul
goto EOF

:HELP
echo Usage: c-example example
echo.

:EOF
