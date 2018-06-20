;; https://www.emacswiki.org/emacs/ShowBindings

(require 'generic-x)
(define-generic-mode 
    'cheat-mode             ;; name of the mode to create
  '("#")                     ;; comments
  '("")                     ;; keywords
  '((" [C\|M]-[^:]+"     . 'binding-face)
    ("^[A-Za-z].+$"      . 'section-face)
    ("\\( [C|S|M] \\):." 1 'bold))
  '("\\.sheet$")                    ;; files for which to activate this mode 
  nil                               ;; other functions to call
  "A mode for cheat sheet"          ;; doc string for this mode
  )

(make-face 'section-face)
(set-face-attribute 'section-face nil
                    :height 140
                    :foreground "#fff"
                    :background "#555"
                    :box '(:line-width 3 :color "#555"))

(make-face 'binding-face)
(set-face-attribute 'binding-face nil
                    :height 120
                    :foreground "black"
                    :background "grey90"
                    :box '(:line-width 1 :color "grey75"))
