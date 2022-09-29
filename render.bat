@echo off
setlocal
if [%1]==[--help] goto HELP
REM ############################################################################
REM                                                                            #
REM Script:   render file                                                      #
REM                                                                            #
REM Purpose:  Run render without opening R first                               #
REM                                                                            #
REM Args:     file is an Rmd file in R Markdown format                         #
REM                                                                            #
REM Requires: R, rmarkdown                                                     #
REM                                                                            #
REM Returns:  Creates HTML file with same prefix in current directory          #
REM                                                                            #
REM ############################################################################

Rscript --slave --vanilla -e "rmarkdown::render('%1', quiet=FALSE)"
