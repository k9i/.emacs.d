;; -*- Emacs-Lisp -*-

(defun shell-clear-buffer ()
  (interactive)
  (let ((comint-buffer-maximum-size 0))
    (comint-truncate-buffer)))

(use-package shell
  :hook (
	 (shell-mode . server-start)
	 )
  :bind (
	 ("C-c l" . shell-clear-buffer)
	 ("C-c c-l" . shell-clear-buffer)
	 )
  )
