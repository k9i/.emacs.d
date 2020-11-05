;; -*- Emacs-Lisp -*-

(use-package shell
  :defer t
  :init
  (defun shell-clear-buffer ()
    (interactive)
    (let ((comint-buffer-maximum-size 0))
      (comint-truncate-buffer)))
  :bind
  (("C-c l" . shell-clear-buffer)
   ("C-c c-l" . shell-clear-buffer))
)
