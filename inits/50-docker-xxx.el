;; -*- Emacs-Lisp -*-


(use-package docker
  :requires bind-key
  :defer t
  :bind ("C-c d" . docker))

(use-package dockerfile-mode
;; :disabled t
  :custom
  (docker-tramp-use-names t "Whether use names instead of id.")
  :defer t
  :mode (
	 ("Dockerfile_*" . dockerfile-mode)
         )
  :init
  (add-hook 'dockerfile-mode-hook
	    '(lambda ()
	       (setq tab-width 4)
	       ))
  (setq dockerfile-indent-offset 4)
  ;;  useless use setq-default in00-setting.el
;;  (add-hook 'docerfile-mode-hook
;;	    '(lambda ()
;;               (setq indent-tabs-mode nil)
;;	       (setq tab-width 4)))
)

(use-package docker-comopse-mode
  :defer t
)

;; workaround hang up on alpine docker
(use-package docker-tramp-compat
  :defer t
  :config
  ;; Disable git backend to speed up sshfs file load among other things
  (setq vc-handled-backends (quote (RCS CVS SVN SCCS Bzr Hg Mtn Arch)))
)
