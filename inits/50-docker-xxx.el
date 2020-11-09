;; -*- Emacs-Lisp -*-


(use-package docker
  :defer t
  :bind ("C-c d" . docker))

(use-package dockerfile-mode
  :defer t
;;  :init
  ;;  useless use setq-default in00-setting.el
;;  (add-hook 'docerfile-mode-hook
;;	    '(lambda ()
;;               (setq indent-tabs-mode nil)
;;	       (setq tab-width 4)))
)



;; workaround hang up on alpine docker
(use-package docker-tramp-compat
  :defer t
  :config
  ;; Disable git backend to speed up sshfs file load among other things
  (setq vc-handled-backends (quote (RCS CVS SVN SCCS Bzr Hg Mtn Arch)))
)
