;; -*- Emacs-Lisp -*-

(use-package conf-mode
  :defer t
  :mode
  (("\\.cnf$" . conf-mode)
;;   ("/raddb/[a-z]+\\'" . conf-mode)
   )
  :init
  (add-hook 'conf-mode-hook
	    '(lambda ()
	       (setq tab-width 4)))
  )
