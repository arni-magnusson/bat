@echo off
setlocal
if [%1]==[] goto HELP
if [%1]==[--help] goto HELP
REM ####################################################################################################################
REM                                                                                                                    #
REM Script:   admb-example example                                                                                     #
REM                                                                                                                    #
REM Purpose:  Copy ADMB example directory                                                                              #
REM                                                                                                                    #
REM Args:     example is a keyword like 'simple'                                                                       #
REM                                                                                                                    #
REM Requires: e:/tolvur/admb/examples/fournier                                                                         #
REM                                                                                                                    #
REM Returns:  Example directory is created                                                                             #
REM                                                                                                                    #
REM ####################################################################################################################

set fournier=e:\tolvur\admb\examples\fournier
goto %1

:CATAGE
set dir=%fournier%\admb\catage&       goto get
:LOGISTIC
set dir=%fournier%\admb-re\logistic&  goto get
:SIMPDLL
set dir=%fournier%\_other\_manual\simpdll&    goto get
:SIMPLE
set dir=%fournier%\admb\simple&       goto get
:SIMPLER
set dir=%fournier%\_other\_manual-re& goto get
:TRUNCREG
set dir=%fournier%\admb\truncreg&     goto get
:UNION
set dir=%fournier%\admb-re\union&     goto get
:VOL
set dir=%fournier%\admb\vol&          goto get

goto get

:GET
rd /s /q %1 2> nul
md %1
copy %dir%\*.dat %1 1>nul 2>nul
copy %dir%\*.pin %1 1>nul 2>nul
copy %dir%\*.tpl %1 > nul
goto EOF

:HELP
echo Usage: admb-example example
echo.

:EOF
