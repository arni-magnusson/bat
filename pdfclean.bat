@echo off
setlocal
if [%1]==[] goto HELP
if [%1]==[--help] goto HELP
REM ############################################################################
REM                                                                            #
REM Script:   pdfclean file                                                    #
REM                                                                            #
REM Purpose:  Replace PDF stamp like '(Downloaded by ...)' with spaces         #
REM                                                                            #
REM Args:     file is a PDF document                                           #
REM                                                                            #
REM Notes:    Writes backup pdfclean.pdf in %temp%                             #
REM                                                                            #
REM Requires: qpdf, Emacs with Lisp function `pdf-clean' in .emacs             #
REM                                                                            #
REM Returns:  Overwrites original PDF file, after removing stamps              #
REM                                                                            #
REM ############################################################################

set backup=%temp%\pdfclean.pdf
set clean="%~dpn1_clean.pdf"
set emacsargs=--eval "(pdf-clean)" --eval "(save-buffers-kill-terminal t)"

copy %1 %backup% > nul
rem pdftk %1 output %clean% uncompress
qpdf --stream-data=uncompress %1 %clean% 2> nul
emacs.exe %clean% %emacsargs%
rem pdftk %clean% output %1 compress
qpdf %clean% %1
del %clean%

goto EOF

:HELP
echo Usage: pdfclean file
echo.

:EOF
