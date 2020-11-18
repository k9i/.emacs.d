;; -*- Emacs-Lisp -*-

;; disable git pager
(setenv "GIT_PAGER" "head -n 40")

(use-package magit
;;  :ensure t
  :pin melpa-stable
  :defer t
  :config
  (setq magit-git-global-arguments
	(nconc magit-git-global-arguments
	       '("-c" "color.ui=false"
		 "-c" "color.diff=false"))))

(use-package git-complete
  :init
  (global-unset-key (kbd "C-c C-c")) ;; 一応unbindしておきましょう
  :config
  (setq git-complete-enable-autopair t)
  :bind
  (("C-c C-c" . git-complete)
   ("C-c C-i" . git-complete)
   ("C-M-_" . git-complete)
   )
)  
;;(global-set-key (kbd "C-c C-c") 'git-complete)
;;(add-to-list 'load-path "~/.emacs.d/git-complete") ;; お好きなように
;;(setq git-complete-enable-autopair t)
 
