;; -*- Emacs-Lisp -*-
;; ~/.emacs.d/init-ediff.el
;;
;; (load "~/.emacs.d/init-ediff")
;;
;; ediff
(setq ediff-window-setup-function 'ediff-setup-windows-plain)
(setq ediff-split-window-function 'split-window-horizontally)

;;(custom-set-faces
;; '(ediff-current-diff-A ((t (:foreground "cyan" :background "brown"))))
;; '(ediff-current-diff-Ancestor ((t (:foreground "cyan" :background "brown"))))
;; )
