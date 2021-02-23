;; -*- Emacs-Lisp -*-
;;
;; (load "~/.emacs.d/init-key")
;; key customizations for Emacs 22 or later
;; C-h to Backspace etc.
;;
(keyboard-translate ?\C-h ?\C-?)
(define-key key-translation-map (kbd "C-h") (kbd "<DEL>"))
(global-set-key "\C-h" 'delete-backward-char)

(global-set-key (kbd "M-g") 'goto-line)
(global-set-key (kbd "M-ESC ESC") 'keyboard-quit)
(global-set-key (kbd "C-o") 'other-window)
(global-set-key "\M-\\" 'indent-region)
(global-set-key (kbd "C-c ;") 'comment-or-uncomment-region)
(setq comment-style 'multi-line)

;; override C-\
(global-set-key (kbd "C-\\") 'indent-region)
;;(global-set-key (kbd "C-\\")  'electric-indent-mode)
(global-set-key (kbd "C-^") 'electric-indent-mode)

;; split-window
(global-set-key (kbd "C-x 2") 'split-window-below)
(global-set-key (kbd "C-x -") 'split-window-below)
(global-set-key (kbd "C-x 3") 'split-window-right)
(global-set-key (kbd "C-x |") 'split-window-right)

;; windmove
(global-set-key (kbd "C-c <left>")  'windmove-left)
(global-set-key (kbd "C-c <right>") 'windmove-right)
(global-set-key (kbd "C-c <up>")    'windmove-up)
(global-set-key (kbd "C-c <down>")  'windmove-down)

(global-set-key (kbd "C-<left>")  'windmove-left)
(global-set-key (kbd "C-<right>") 'windmove-right)
(global-set-key (kbd "C-<up>")    'windmove-up)
(global-set-key (kbd "C-<down>")  'windmove-down)

(global-set-key (kbd "<f6>") 'other-window)
(global-set-key (kbd "M-o") 'other-window)
(global-set-key (kbd "C-x C-o") 'other-window)
(global-set-key (kbd "C-x d") 'dired-toggle)

;; magit
(global-set-key (kbd "C-x g") 'magit-status)

;; ibuffer
(global-set-key (kbd "C-x C-b") 'ibuffer)

;; shell
(global-set-key (kbd "C-c s") 'shell)

;; quick-yes
(require 'quick-yes)

;; revert-buffer-no-confirm
(require 'revert-buffer-no-confirm)
(global-set-key (kbd "C-x R")  'revert-buffer-no-confirm)
(global-set-key (kbd "<f2> r")  'auto-revert-tail-mode)

;; assign <f2>,<f5>
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
(global-set-key (kbd "<f2> F")  'describe-function)

(global-set-key (kbd "<f2> p")  'package-list-packages)

;; assign <f2>,<f5>
;; face
(global-set-key (kbd "<f5> l")  'list-faces-display)
(global-set-key (kbd "<f5> f")  'describe-face)

;; eregistory for ediff
(global-set-key (kbd "<f5> e")  'eregistry)

;; customize-theme
(global-set-key (kbd "<f5> t")  'customize-themes)

;; describe-*
(global-set-key (kbd "<f5> b")  'describe-bindings)
(global-set-key (kbd "<f5> k")  'describe-key)
(global-set-key (kbd "<f5> F")  'describe-function)

(global-set-key (kbd "<f5> p")  'package-list-packages)
