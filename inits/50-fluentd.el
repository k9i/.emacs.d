;; -*- Emacs-Lisp -*-

(use-package fluentd-mode
  :defer t
  :mode (
	 ("fluent.+\\.conf\\'" . fluentd-mode)
	 )
  )
