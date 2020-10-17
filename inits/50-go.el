 ;; -*- Emacs-Lisp -*-

(use-package go-mode
  :defer t
  :init
  (add-hook 'go-mode-hook
	    '(lambda ()
	       (setq tab-width 2)))
  )
