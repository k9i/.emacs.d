 ;; -*- Emacs-Lisp -*-

(use-package freeradius-mode
  :defer t
  :init
  (add-hook 'freeradius-mode-hook
	    '(lambda ()
	       (setq tab-width 4)
	       ))
  :mode (
	 ("raddb/sites-\\(?:available\\|enabled\\)/.*\\'" . freeradius-mode)
	 ("raddb/mods-\\(?:available\\|enabled\\|config\\)/.*\\'" . freeradius-mode)
	 ("raddb/policy\\.d/.*\\'" . freeradius-mode)
	 ("raddb/.+\\.conf\\'" . freeradius-mode)
	 )
  )
