@echo off
setlocal
if [%1]==[] goto HELP
if [%1]==[--help] goto HELP
REM ####################################################################################################################
REM                                                                                                                    #
REM Script:   exiftool [options] file                                                                                  #
REM                                                                                                                    #
REM Purpose:  Run exiftool without calling perl and full path of script                                                #
REM                                                                                                                    #
REM Args:     See exiftool documentation                                                                               #
REM                                                                                                                    #
REM Requires: exiftool                                                                                                 #
REM                                                                                                                    #
REM Returns:  EXIF tags are shown/written, depending on options                                                        #
REM                                                                                                                    #
REM ####################################################################################################################

set script=%gnu%/graphics/exiftool/exiftool
perl %script% %*
goto EOF

:HELP
set script=%gnu%/graphics/exiftool/exiftool
perl %script% --help

:EOF
