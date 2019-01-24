;; -*- Emacs-Lisp -*-

(require 'smartrep)
(setq smartrep-read-event-timeout 2)
(smartrep-define-key global-map "C-x"
		     '(("o" . other-window)
		       ("0" . delete-window)
		       ("1" . delete-other-windows)
		       ("2" . split-window-below)
		       ("3" . split-window-right)
		       ("{" . shrink-window-horizontally)
		       ("[" . shrink-window-horizontally)
		       ("}" . enlarge-window-horizontally)
		       ("]" . enlarge-window-horizontally)
		       ("+" . balance-windows)
		       ("~" . enlarge-window) ;; S-^ in jp
		       ("\\" . enlarge-window)
		       ("|" . shrink-window) ;; S-\ in jp
		       ("-" . shrink-window)))

;; (use-package smartrep
;;   :ensure t
;;   :init
;;   :config
;;   (smartrep-define-key global-map "C-x"
;;                     '(("o" . other-window)
;;                       ("0" . delete-window)
;;                       ("1" . delete-other-windows)
;;                       ("2" . split-window-below)
;;                       ("3" . split-window-right)
;;                       ("{" . shrink-window-horizontally)
;;                       ("[" . shrink-window-horizontally)
;;                       ("}" . enlarge-window-horizontally)
;;                       ("]" . enlarge-window-horizontally)
;;                       ("+" . balance-windows)
;;                       ("^" . enlarge-window)
;;                       ("~" . shrink-window) ;; S-^ in jp
;;                       ("-" . shrink-window)))
;;   )
