;; -*- Emacs-Lisp -*-

(require 'browse-kill-ring+)
(browse-kill-ring-default-keybindings)

;; suppress byte-compile warning
;;(defmacro browse-kill-ring-default-keybindings (&rest args))

;;(use-package browse-kill-ring+
;;  :if (and (locate-library "browse-kill-ring")
;;	   (locate-library "browse-kill-ring+"))
;;  ;; :defer t
;;  :requires browse-kill-ring
;;  :functions browse-kill-ring-default-keybindings
;;  :config
;;  (browse-kill-ring-default-keybindings)
;;  )
