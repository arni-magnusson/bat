@echo off
setlocal
if [%1]==[--help] goto HELP
REM ############################################################################
REM                                                                            #
REM Script:   book file                                                        #
REM                                                                            #
REM Purpose:  Append empty page to PDF book                                    #
REM                                                                            #
REM Args:     file is a PDF document                                           #
REM                                                                            #
REM Notes:    Empty page is same size as page 42                               #
REM                                                                            #
REM Warning:  Filename must not contain spaces                                 #
REM                                                                            #
REM Requires: pdftk, pdf.blank(), sejda-console                                #
REM                                                                            #
REM Returns:  New file "%file%_book.pdf" is created in current directory       #
REM                                                                            #
REM ############################################################################

rem 1  Full target path and short prefix
set book=%~dpn1_book.pdf
set x=%~n1

rem 2  Create _page.pdf and _size.txt
pdftk %1 cat 42 output %x%_page.pdf
pdfinfo %x%_page.pdf > %x%_size.txt

rem 3  Set width and height
for /F "usebackq tokens=*" %%V in^
 (`gawk "/Page size/ {print $3}" %x%_size.txt`) do set width=%%V
for /F "usebackq tokens=*" %%V in^
 (`gawk "/Page size/ {print $5}" %x%_size.txt`) do set height=%%V
del %x%_page.pdf %x%_size.txt

rem 4  Create empty %x%_empty.pdf
echo pdf.blank("%x%_empty.pdf", as.numeric(Sys.getenv("width"))/72,^
 as.numeric(Sys.getenv("height"))/72) | R --slave
echo.

rem 5  Suggest next command
echo rem pdftk %x%_book.pdf cat - output %x%_sel.pdf
echo.

rem 6  Merge book and empty page
sejda-console merge -f %1 %x%_empty.pdf -o %book% --overwrite

goto EOF

:HELP
echo Usage: book file

:EOF
