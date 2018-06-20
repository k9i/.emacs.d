;; https://www.emacswiki.org/emacs/SearchKeybind

(defun search-keybind (regexp &optional nlines)
   (interactive (occur-read-primary-args))
   (save-excursion
     (describe-bindings)
     (set-buffer "*Help*")
     (occur regexp nlines)
     (delete-windows-on "*Help*")))

(global-set-key (kbd "C-M-u") 'search-keybind)
