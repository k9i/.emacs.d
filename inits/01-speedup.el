;; https://github.com/uwabami/emacs
(defconst my:saved-file-name-handler-alist file-name-handler-alist)
(setq file-name-handler-alist nil)
(add-hook 'emacs-startup-hook
          (lambda ()
            (setq file-name-handler-alist my:saved-file-name-handler-alist)))
