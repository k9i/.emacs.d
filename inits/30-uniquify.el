;; The library uniquify overrides Emacs’ default mechanism for making buffer names unique 

(require 'uniquify)
;; (setq uniquify-buffer-name-style 'forward)
;; (setq uniquify-buffer-name-style 'reverse)
(setq uniquify-buffer-name-style 'post-forward)
;; (setq uniquify-buffer-name-style 'post-forward-angle-brackets)

(setq uniquify-min-dir-content 1)
