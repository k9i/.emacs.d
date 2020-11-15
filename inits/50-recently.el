;; -*- Emacs-Lisp -*-

(use-package recently
;;  :disabled t
  :init
  (recently-mode)
   (global-set-key "\C-x\ \C-r" 'recently-show)
   :bind
   (:map recently-show-tabulated-mode-map
	 ("f" . recently-show-tabulated-find-file)
	 ("o" . recently-show-tabulated-dired)
	 ("[ESC]" . recently-show-tabulated-close)
	 )
   )
