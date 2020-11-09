;; -*- Emacs-Lisp -*-

(use-package shell
  :defer t
  :init
  (defun shell-clear-buffer ()
    (interactive)
    (let ((comint-buffer-maximum-size 0))
      (comint-truncate-buffer)))
  (add-hook 'shell-mode-hook
            '(lambda ()
               (server-start)))
  :bind
  (("C-c l" . shell-clear-buffer)
   ("C-c c-l" . shell-clear-buffer))

  )
