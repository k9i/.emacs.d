;; 1. Add the `emacs-color-theme-solarized` directory to your Emacs `custom-theme-load-path`.
;; 2. Add `(load-theme 'solarized t)` to your Emacs init file.
;; 3. Reload the init file, or restart Emacs.

(add-to-list 'custom-theme-load-path (locate-user-emacs-file "themes/"))
(load-theme 'molokai t)
