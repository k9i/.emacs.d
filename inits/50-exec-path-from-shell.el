;; -*- Emacs-Lisp -*-

(use-package exec-path-from-shell
;;  :ensure t
  :config
  (setq exec-path-from-shell-arguments nil)
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
