@echo off

f:\gnu\emacs244\bin\runemacs.exe -Q -l e:/verk/admb/ide/dot/admb-ide-112.el -f admb-mode^
 --eval "(setenv \"ADMB_HOME\" \"f:/admb/admb112-gcc481-win32\")"^
 --eval "(setenv \"PATH\" \"c:/windows/system32;f:/admb/admb112-gcc481-win32/bin;f:/gnu/gcc481-win32/bin;f:/gnu/gdb761-win32/bin\")"
