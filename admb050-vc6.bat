@echo off
set ADMB_HOME=%admb%/%~n0
set INCLUDE=%apps%/microsoft/vc6/include
set LIB=%apps%/microsoft/vc6/lib
set PATH=%apps%/microsoft/vc6/bin;%admb_home%/bin
echo ADMB_HOME=%admb_home%
echo INCLUDE=%include%
echo LIB=%lib%
PATH
