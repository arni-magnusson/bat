@echo off
setlocal
if [%1]==[--help] goto HELP
REM ####################################################################################################################
REM                                                                                                                    #
REM Script:   hafro [-all] [-off] [-on] [-viktor]                                                                      #
REM                                                                                                                    #
REM Purpose:  Connect/disconnect Hafro network drives                                                                  #
REM                                                                                                                    #
REM Args:     all means connect '%USERNAME%', 'haf', 'reikn', 'pakkar', 'u2'                                           #
REM           off means disconnect                                                                                     #
REM           on (default) means connect '%USERNAME%', 'haf', and 'reikn'                                              #
REM           viktor means connect 'install', 'kerfi', 'media', and 'temp'                                             #
REM                                                                                                                    #
REM Returns:  Adds or removes Windows drive letters                                                                    #
REM                                                                                                                    #
REM ####################################################################################################################

rem Pop args until file=%1
set action=on
:STARTLOOP
if [%1]==[] goto ENDLOOP
if [%1]==[-all]    set action=all    & shift
if [%1]==[-off]    set action=off    & shift
if [%1]==[-on]     set action=on     & shift
if [%1]==[-viktor] set action=viktor & shift
if [%1]==[all]     set action=all    & shift
if [%1]==[off]     set action=off    & shift
if [%1]==[on]      set action=on     & shift
if [%1]==[viktor]  set action=viktor & shift
goto STARTLOOP
:ENDLOOP

goto %action%

:ALL
if not exist e: NET USE E: \\hafkaldi\%USERNAME% /persistent:no
if not exist h: NET USE H: \\hafkaldi\haf        /persistent:no
if not exist r: NET USE R: \\hafkaldi\reikn      /persistent:no
if not exist m: NET USE M: \\hafkaldi\pakkar     /persistent:no
if not exist u: NET USE U: \\hafkaldi\u2         /persistent:no
goto EOF

:OFF
if exist e: NET USE E: /delete
if exist h: NET USE H: /delete
if exist r: NET USE R: /delete
if exist m: NET USE M: /delete
if exist u: NET USE U: /delete
if exist n: NET USE N: /delete
if exist o: NET USE O: /delete
if exist p: NET USE P: /delete
if exist q: NET USE Q: /delete
goto EOF

:ON
if not exist e: NET USE E: \\hafkaldi\%USERNAME% /persistent:no
if not exist h: NET USE H: \\hafkaldi\haf        /persistent:no
if not exist r: NET USE R: \\hafkaldi\reikn      /persistent:no
goto EOF

:VIKTOR
if not exist n: NET USE N: \\stofupika\install /persistent:no
if not exist o: NET USE O: \\stofupika\kerfi   /persistent:no
if not exist p: NET USE P: \\stofupika\media   /persistent:no
if not exist q: NET USE Q: \\stofupika\temp    /persistent:no
goto EOF

:HELP
echo Usage: hafro [-all] [-off] [-on] [-viktor]
echo.

:EOF
