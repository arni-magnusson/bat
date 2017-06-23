@echo off
setlocal
REM ####################################################################################################################
REM                                                                                                                    #
REM Script:  fizz2                                                                                                     #
REM                                                                                                                    #
REM Purpose: Solution to FizzBuzz test, using a temporary external script                                              #
REM                                                                                                                    #
REM Notes:    The task is to print the numbers from 1 to 100, with the following exceptions:                           #
REM           - for multiples of three print "Fizz" instead of the number                                              #
REM           - for multiples of five print "Buzz"                                                                     #
REM           - for numbers which are multiples of both three and five print "FizzBuzz"                                #
REM           Code is 526 bytes                                                                                        #
REM                                                                                                                    #
REM Returns:  Numbers, Fizz, Buzz, and FizzBuzz                                                                        #
REM                                                                                                                    #
REM ####################################################################################################################

set inner=%temp%\inner.bat

echo set /a m=%%1 %%%% 3 + %%1 %%%% ^5>      %inner%
echo if %%m%%==0 echo FizzBuzz ^& goto EOF>> %inner%
echo set /a m=%%1 %%%% ^3>>                  %inner%
echo if %%m%%==0 echo Fizz     ^& goto EOF>> %inner%
echo set /a m=%%1 %%%% ^5>>                  %inner%
echo if %%m%%==0 echo Buzz     ^& goto EOF>> %inner%
echo echo %%1>>                              %inner%
echo :EOF>>                                  %inner%

for /L %%i in (1,1,100) do call %inner% %%i

del %inner%
