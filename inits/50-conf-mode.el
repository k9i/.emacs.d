;; -*- Emacs-Lisp -*-

(use-package conf-mode
  :defer t
  :mode
  (("\\.cnf\\'" . conf-mode)
   ("\\grafana.ini\\'" . conf-unix-mode)
;;   ("/raddb/[a-z]+\\'" . conf-mode)  ;; see freeradius-mode
   )
  :init
  (add-hook 'conf-mode-hook
	    '(lambda ()
	       (setq tab-width 4)))
  )
