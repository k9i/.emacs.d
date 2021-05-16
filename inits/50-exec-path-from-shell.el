;; -*- Emacs-Lisp -*-

;;(defvar exec-path-from-shell-arguments nil)

(use-package exec-path-from-shell
  :ensure t
  ;;  :defer t

  ;; :init
  ;; (setq exec-path-from-shell-arguments nil)

  :custom
  ((exec-path-from-shell-check-startup-files . nil)
   (exec-path-from-shell-arguments . nil)
   )

  :config
  (exec-path-from-shell-initialize)
  (exec-path-from-shell-copy-env "HISTFILE")

  (defun turn-on-comint-history (history-file)
    (setq comint-input-ring-file-name history-file)
    (comint-read-input-ring 'silent))

  (add-hook 'shell-mode-hook
	    (lambda ()
	      (turn-on-comint-history (getenv "HISTFILE"))))
  (add-hook 'inf-ruby-mode-hook
	    (lambda ()
	      (turn-on-comint-history ".pry_history"))))
