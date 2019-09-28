;; -*- Emacs-Lisp -*-

(use-package terraform-mode
;;  :init
;;  (add-to-list 'auto-mode-alist '("\\.tf.backup$" . terraform-mode))
;;  (add-to-list 'auto-mode-alist '("\\.tfbackup$" . terraform-mode))
  :mode (("\\.tf\\.backup$" . terraform-mode)
	 ("\\.tfbackup$" . terraform-mode)
	 ("\\.tf_+" . terraform-mode))
  )

;;(when (>= emacs-major-version 24)
;;  (require 'json-mode)
;;  (add-to-list 'auto-mode-alist '("\\.tfstate$" . json-mode))
;;  (add-to-list 'auto-mode-alist '("\\.tfstate.backup$" . json-mode))
;;  (add-to-list 'auto-mode-alist '("\\.tfstate.backup$" . json-mode))
;;  )
