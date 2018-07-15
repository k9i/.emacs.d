;; 1. Add the `emacs-color-theme-solarized` directory to your Emacs `custom-theme-load-path`.
;; 2. Add `(load-theme 'solarized t)` to your Emacs init file.
;; 3. Reload the init file, or restart Emacs.

(add-to-list 'custom-theme-load-path (locate-user-emacs-file "themes/"))
;;(add-to-list 'custom-theme-load-path (locate-user-emacs-file "themes/emacs-color-theme-solarized"))
(add-to-list 'load-path (locate-user-emacs-file "themes"))

;; or use 'M-x customize-theme'
(cond
 ((< emacs-major-version 24)
  (load-theme 'molokai t)
  )
 ((>= emacs-major-version 24)
  (load-theme 'molokai t)
;;  (load-theme 'moe-dark t)
;;  (require 'apropospriate)
;;  (load-theme 'apropospriate-dark t)
  ))


