;; -*- Emacs-Lisp -*-

(use-package json-mode
  :defer t
  :mode
  (("\\.tfstate$" . json-mode)
   ("\\.tfstate.backup$" . json-mode)
   ("\\.tfstate_+$" . json-mode))
  :init
  (add-hook 'json-mode-hook
            (lambda ()
              (make-local-variable 'js-indent-level)
              (setq js-indent-level 2)))
  )
