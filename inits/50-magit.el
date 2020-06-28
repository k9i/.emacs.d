;; -*- Emacs-Lisp -*-

(use-package magit
;;  :ensure t
  :config
  (setq magit-git-global-arguments
	(nconc magit-git-global-arguments
	       '("-c" "color.ui=false"
		 "-c" "color.diff=false"))))
