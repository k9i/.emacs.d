(use-package buffer-flip
  :ensure t
;;  :chord (("u8" . buffer-flip)) ;; see: 50-key-chord.el
  :bind
  (("C-x B" . buffer-flip))
  (:map buffer-flip-map
        ( "n" .   buffer-flip-forward)
        ( "p" .   buffer-flip-backward)
        ( "8" .   buffer-flip-forward)
        ( "*" .   buffer-flip-backward) ;; for us
        ( "(" .   buffer-flip-backward) ;; for jp
        ( "C-g" . buffer-flip-abort)))
