;; -*- Emacs-Lisp -*-

;; disable git pager
(setenv "GIT_PAGER" "head -n 40")

;; Workaround: in root user magit-git-global-arguments not work
;;(defvar magit-git-executable)
;;(setq magit-git-executable "magit.sh")

(use-package magit
  :ensure t
;;  :requires magit-popup magit-section
  :requires transient  ;; or remove transient*/transient.elc then restart
;;  :pin melpa-stable
  ;;  :defines mait-git-global-arguments magit-git-executable
  ;;:functions magit-status magit-dispatch
  :config
  (setq magit-git-executable "git")  ;; Restore pre-workaround setting
  (setq magit-git-global-arguments
	(nconc magit-git-global-arguments
	       '("-c" "color.ui=false"
		 "-c" "color.diff=false")))
  :bind
  (("C-x g" . magit-status)
   ("C-x M-g" . magit-dispatch))
)

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
