;; or use 'M-x customize-theme'
(cond
 ((< emacs-major-version 24)
  (load-theme 'molokai t)
;;  (load-theme 'flatui-dark t)
  )
 ((>= emacs-major-version 24)
  (load-theme 'molokai t)
;;  (load-theme 'flatui-dark t)
  ))
