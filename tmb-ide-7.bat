@echo off

c:/tmb/emacs/bin/runemacs.exe -Q^
 --eval "(setenv \"PATH\" \"c:/tmb/r/bin/x64\")"^
 --eval "(setq inferior-R-program-name \"c:/tmb/r/bin/x64/rterm.exe\")"^
 -l c:/tmb/ide/.emacs^
 -l c:/tmb/ess/lisp/ess-site.elc^
 -l c:/tmb/ide/tmb.elc^
 -f tmb-mode
