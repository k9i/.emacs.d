;; -*- Emacs-Lisp -*-

;; default to google
(setq eww-search-prefix "https://www.google.co.jp/search?q=")

;; Usage from info
;; - q  leave EWW by pressing ‘q’ (eww-quit)
;; - g  reload the web page hit ‘g’ (eww-reload)
;; - w  copy the current URL to the kill ring.‘w’ (‘eww-copy-page-url’)
;; - R  (‘eww-readable’)  “readable” text
;; - F  (‘eww-toggle-fonts’) toggles whether to use variable-pitch fonts or not.  This sets the ‘shr-use-fonts’ variable.
;; - d  A URL under the point can be downloaded with ‘d’ (‘eww-download’).
;;      The file will be written to the directory specified in ‘eww-download-directory’ (Default: ‘~/Downloads/’).
;; - v  view source

;; customize
;; - c  (eww-toggle-colors) toggles whether to use HTML-specified colors or not.  This sets the ‘shr-use-colors’ variable.

(define-key eww-mode-map "r" 'eww-reload)
;;(define-key eww-mode-map "c 0" 'eww-copy-page-url)
(define-key eww-mode-map "c" 'eww-toggle-colors)
(define-key eww-mode-map "p" 'scroll-down-command)
(define-key eww-mode-map "n" 'scroll-up-command)
(define-key eww-mode-map "h" 'left-char)
(define-key eww-mode-map "j" 'next-line)
(define-key eww-mode-map "k" 'previous-line)
(define-key eww-mode-map "l" 'right-char)
(define-key eww-mode-map "b" 'eww-back-url)
(define-key eww-mode-map "f" 'eww-forward-url)
(define-key eww-mode-map "r" 'eww-reload)
