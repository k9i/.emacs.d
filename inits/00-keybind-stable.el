;; -*- Emacs-Lisp -*-
;; ~/.emacs.d/init-key.el
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

;; windmove
(global-set-key (kbd "C-c <left>")  'windmove-left)
(global-set-key (kbd "C-c <right>") 'windmove-right)
(global-set-key (kbd "C-c <up>")    'windmove-up)
(global-set-key (kbd "C-c <down>")  'windmove-down)

(global-set-key (kbd "C-<left>")  'windmove-left)
(global-set-key (kbd "C-<right>") 'windmove-right)
(global-set-key (kbd "C-<up>")    'windmove-up)
(global-set-key (kbd "C-<down>")  'windmove-down)

;;
(global-set-key (kbd "<f6>") 'other-window)
(global-set-key (kbd "C-x d") 'dired-toggle)
