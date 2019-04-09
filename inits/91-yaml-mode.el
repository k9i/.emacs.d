(when (>= emacs-major-version 24)
  (require 'yaml-mode)
  (add-to-list 'auto-mode-alist '("\\.ya?ml$" . yaml-mode))
  (define-key yaml-mode-map "\C-m" 'electric-newline-and-maybe-indent)
  (define-key yaml-mode-map "\C-j" 'electric-indent-just-newline)
  ;;  (define-key yaml-mode-map "\C-m" 'newline-and-indent)
  )
