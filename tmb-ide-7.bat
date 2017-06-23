@echo off

c:/tmb/emacs/bin/runemacs.exe -Q^
 -l c:/tmb/ide/tmb.elc^
 -l c:/tmb/ide/.emacs^
 -f tmb-mode^
 --eval "(setenv \"PATH\" \"c:/tmb/r/bin/x64\")"^
 --eval "(setq inferior-R-program-name \"c:/tmb/r/bin/x64/rterm.exe\")"^
 -l c:/tmb/ess/lisp/ess-site.elc
