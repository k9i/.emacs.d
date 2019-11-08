;; -*- Emacs-Lisp -*-

(use-package json-mode
  :mode
  (("\\.tfstate$" . json-mode)
   ("\\.tfstate.backup$" . json-mode)
   ("\\.tfstate_+$" . json-mode))
  )

(add-hook 'json-mode-hook
          (lambda ()
            (make-local-variable 'js-indent-level)
            (setq js-indent-level 2)))
