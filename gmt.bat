@echo off
rem setglobal
REM ############################################################################
REM                                                                            #
REM Script:  gmt                                                               #
REM                                                                            #
REM Purpose: Initialize GMT environment                                        #
REM                                                                            #
REM Example: gmt                                                               #
REM                                                                            #
REM Returns: Creates .gmtdefaults4 in current directory                        #
REM                                                                            #
REM ############################################################################

gmtset -Ds DEGREE_SYMBOL=degree PLOT_DEGREE_FORMAT=F

echo.
echo GMT environment initialized
echo.
echo Session recreating R library(gmt)
echo.

echo pscoast -JM18c -R27W/11W/62N/68N -Di -G100/200/100 -B4f2g2/2f1g1    -K ^>  map.ps
echo psxy demo.xy -JM -R -Scp -W2p                                    -O -K ^>^> map.ps
echo pstext demo.txt -JM -R                                           -O -K ^>^> map.ps
echo psxy demo.bar -JM -R -W1p -G180 -A -m                            -O    ^>^> map.ps
