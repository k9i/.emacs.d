;; -*- Emacs-Lisp -*-

(use-package tempbuf
;;  :ensure t
  :hook (
	 (custom-mode . turn-on-tempbuf-mode)
	 (dired-mode . turn-on-tempbuf-mode)
	 (w3-mode . turn-on-tempbuf-mode)
	 (Man-mode . turn-on-tempbuf-mode)
;;	 (view-mode . turn-on-tempbuf-mode)
;;	 (magit-mode . turn-on-tempbuf-mode)
	 )
  )
