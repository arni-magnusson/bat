@echo off

f:\gnu\emacs234\bin\runemacs.exe -Q -l e:/verk/admb/ide/dot/admb-ide-101.el^
 -f admb-mode --eval "(setenv \"ADMB_HOME\" \"f:/admb/admb101-gcc452-win32\")"^
 --eval "(setenv \"PATH\" \"f:/admb/admb101-gcc452-win32/bin;^
f:/gnu/gcc452-win32/bin;f:/gnu/gdb74/bin\")"
