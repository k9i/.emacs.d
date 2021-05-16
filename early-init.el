
;; https://github.com/kiwanami/emacs-epc/issues/35
;; suppress cl is depricated message in emacs27
(setq byte-compile-warnings '(cl-functions))

(provide 'early-init)
