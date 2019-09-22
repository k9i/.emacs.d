;; -*- Emacs-Lisp -*-

(use-package terraform-mode
  :config
  (add-to-list 'auto-mode-alist '("\\.tf.backup$" . terraform-mode))
  (add-to-list 'auto-mode-alist '("\\.tfbackup$" . terraform-mode))
  )

(when (>= emacs-major-version 24)
  (require 'json-mode)
  (add-to-list 'auto-mode-alist '("\\.tfstate$" . json-mode))
  (add-to-list 'auto-mode-alist '("\\.tfstate.backup$" . json-mode))
  (add-to-list 'auto-mode-alist '("\\.tfstate.backup$" . json-mode))
  )