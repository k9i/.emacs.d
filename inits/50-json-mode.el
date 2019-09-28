;; -*- Emacs-Lisp -*-

(use-package json-mode
  :mode
  (("\\.tfstate$" . json-mode)
   ("\\.tfstate.backup$" . json-mode)
   ("\\.tfstate_+$" . json-mode))
  )

