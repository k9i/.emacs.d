;; -*- Emacs-Lisp -*-
;;
;; unstable or testing key customizations for Emacs 22 or later
;;



;; quick-yes
(require 'quick-yes)

;; revert-buffer-no-confirm
(require 'revert-buffer-no-confirm)
(global-set-key (kbd "C-x R")  'revert-buffer-no-confirm)


;; face
(global-set-key (kbd "<f2> l")  'list-faces-display)
(global-set-key (kbd "<f2> d")  'descibe-face)

;; eregistory for ediff
(global-set-key (kbd "<f2> e")  'eregistry)
