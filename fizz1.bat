@echo off
setlocal
REM ############################################################################
REM                                                                            #
REM Script:  fizz1                                                             #
REM                                                                            #
REM Purpose: Solution to FizzBuzz test, using a while loop                     #
REM                                                                            #
REM Notes:    The task is to print the numbers from 1 to 100, with the         #
REM             following exceptions:                                          #
REM             - for multiples of three print "Fizz" instead of the number    #
REM             - for multiples of five print "Buzz"                           #
REM             - for numbers which are multiples of both three and five print #
REM               "FizzBuzz"                                                   #
REM           Code is 305 bytes                                                #
REM                                                                            #
REM Returns:  Numbers, Fizz, Buzz, and FizzBuzz                                #
REM                                                                            #
REM ############################################################################

set i=1

:STARTLOOP

set /a m=%i% %% 3 + %i% %% 5
if %m%==0 echo FizzBuzz & goto CHECK
set /a m=%i% %% 3
if %m%==0 echo Fizz     & goto CHECK
set /a m=%i% %% 5
if %m%==0 echo Buzz     & goto CHECK
echo %i%

:CHECK

if %i%==100 (goto ENDLOOP) else (set /a i=%i%+1 & goto STARTLOOP)

:ENDLOOP
