;; -*- Emacs-Lisp -*-
;;
;; unstable or testing key customizations for Emacs 22 or later
;;



;; quick-yes
(require 'quick-yes)

;; revert-buffer-no-confirm
(require 'revert-buffer-no-confirm)
(global-set-key (kbd "C-x R")  'revert-buffer-no-confirm)
(global-set-key (kbd "<f2> r")  'auto-revert-tail-mode)


;; assign <f2>
;; face
(global-set-key (kbd "<f2> l")  'list-faces-display)
(global-set-key (kbd "<f2> f")  'describe-face)

;; eregistory for ediff
(global-set-key (kbd "<f2> e")  'eregistry)

;; customize-theme
(global-set-key (kbd "<f2> t")  'customize-themes)

;; describe-*
(global-set-key (kbd "<f2> b")  'describe-bindings)
(global-set-key (kbd "<f2> k")  'describe-key)
