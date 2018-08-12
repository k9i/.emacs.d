;; -*- Emacs-Lisp -*-

;; https://emacs.stackexchange.com/questions/202/close-all-dired-buffers
(setq-default ibuffer-saved-filter-groups
              `(("Default"
                 ;; I create a group call Dired, which contains all buffer in dired-mode
                 ("Dired" (mode . dired-mode))
                 ("Temporary" (name . "\*.*\*"))
                 )))

;; type "/ R" to group buffer list mode.
;; type "/ r" to revert buffer list mode.

;; add-hook ?
;;(ibuffer-switch-to-saved-filter-groups "Default")
