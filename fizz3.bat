@echo off
setlocal
REM ############################################################################
REM                                                                            #
REM Script:  fizz3                                                             #
REM                                                                            #
REM Purpose: Solution to FizzBuzz test, using an inner block                   #
REM                                                                            #
REM Notes:    The task is to print the numbers from 1 to 100, with the         #
REM             following exceptions:                                          #
REM             - for multiples of three print "Fizz" instead of the number    #
REM             - for multiples of five print "Buzz"                           #
REM             - for numbers which are multiples of both three and five print #
REm               "FizzBuzz"                                                   #
REM           Code is 257 bytes                                                #
REM                                                                            #
REM Returns:  Numbers, Fizz, Buzz, and FizzBuzz                                #
REM                                                                            #
REM ############################################################################

for /L %%i in (1,1,100) do call :INNER %%i

goto EOF

:INNER
set /a m=%1 %% 3 + %1 %% 5
if %m%==0 echo FizzBuzz & goto EOF
set /a m=%1 %% 5
if %m%==0 echo Buzz     & goto EOF
set /a m=%1 %% 3
if %m%==0 echo Fizz     & goto EOF
echo %1

:EOF
