;; 1. Add the `emacs-color-theme-solarized` directory to your Emacs `custom-theme-load-path`.
;; 2. Add `(load-theme 'solarized t)` to your Emacs init file.
;; 3. Reload the init file, or restart Emacs.

(add-to-list 'custom-theme-load-path (locate-user-emacs-file "themes/"))
(add-to-list 'custom-theme-load-path (locate-user-emacs-file "themes/emacs-color-theme-solarized"))
(add-to-list 'load-path (locate-user-emacs-file "themes"))
	     
(cond
 ((< emacs-major-version 24)
  (load-theme 'molokai t))
 ((>= emacs-major-version 24)
  ;;     (load-theme 'molokai t)
  ;;     (enable-theme 'molokai)

;;  (require 'color-theme-solarized)
;;  (color-theme-solarized)

  (set-terminal-parameter nil 'background-mode 'dark)
  (load-theme 'solarized t)
  (add-hook 'after-make-frame-functions
            (lambda (frame)
              (let ((mode (if (display-graphic-p frame) 'light 'dark)))
		(set-frame-parameter frame 'background-mode mode)
		(set-terminal-parameter frame 'background-mode mode))
              (enable-theme 'solarized))))
)

;(load-theme 'material t)
;(enable-theme 'monokai)

;(load-theme 'wombat t)
;(load-theme 'misterioso t)
;(load-theme 'tango-dark t)

;(load-theme 'solarized t)
