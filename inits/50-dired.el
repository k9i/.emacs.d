;; -*- Emacs-Lisp -*-
;; ~/.emacs.d/init-dired.el

;;=======================================================================
;; rename file with 'r' then C-x C-s
(add-hook 'dired-load-hook 
	  (lambda ()
	    (setq wdired-allow-to-change-permissions t)
	    (define-key dired-mode-map "r" 'wdired-change-to-wdired-mode)))

;; add key "/", "V" to togle dired-omit-mode
(add-hook 'dired-load-hook 
	  (lambda ()
	    (define-key dired-mode-map "/" 'dired-omit-mode)
	    (define-key dired-mode-map "V" 'dired-omit-mode)
	    (define-key dired-mode-map (kbd ".") 'dired-omit-switch)
	    (define-key dired-mode-map (kbd ",") 'dired-clean-directory)))

;;(define-key dired-mode-map (kbd "/") 'dired-omit-switch)
;;(define-key dired-mode-map (kbd "V") 'dired-omit-switch)
;;(define-key dired-mode-map (kbd ".") 'dired-omit-switch)
;;(define-key dired-mode-map (kbd ",") 'dired-clean-directory)

;;=======================================================================

(setq dired-auto-revert-buffer t)

;; Do What I Mean
;; make default target to other window.
;; be carefull using 'R'. default is move to other window. use 'r' to rename.
(setq dired-dwim-target t)

;; list directory first.
;;(setq dired-listing-switches "-AFl --group-directories-first")
;;(setq dired-listing-switches "-AFl")


;; https://www.emacswiki.org/emacs/DiredOmitMode
;; default key: C-x M-o to display dotfiles.
(require 'dired-x)
(setq-default dired-omit-files-p t) ; Buffer-local variable
;; add dotfiles to omit
(setq dired-omit-files (concat dired-omit-files "\\|^\\..+$"))

;; No Omit Mode for `recover-session'
;;(defun enable-dired-omit-mode () (dired-omit-mode 1))
;;(add-hook 'dired-mode-hook 'enable-dired-omit-mode)

(defadvice recover-session (around disable-dired-omit-for-recover activate)
  (let ((dired-mode-hook dired-mode-hook))
    (remove-hook 'dired-mode-hook 'enable-dired-omit-mode)
    ad-do-it))

;; Remember Omit State
(defvar v-dired-omit t
  "If dired-omit-mode enabled by default. Don't setq me.")
(setq v-dired-omit nil)
(defun dired-omit-switch ()
  "This function is a small enhancement for `dired-omit-mode', which will
   \"remember\" omit state across Dired buffers."
  (interactive)
  (if (eq v-dired-omit t)
      (setq v-dired-omit nil)
    (setq v-dired-omit t))
  (dired-omit-caller)
  (revert-buffer))

(defun dired-omit-caller ()
  (if v-dired-omit
      (setq dired-omit-mode t)
    (setq dired-omit-mode nil)))

(define-key dired-mode-map (kbd "C-x M-o") 'dired-omit-switch)
(add-hook 'dired-mode-hook 'dired-omit-caller)

;; Toggle Showing Dot Files
(defun dired-dotfiles-toggle ()
  "Show/hide dot-files"
  (interactive)
  (when (equal major-mode 'dired-mode)
    (if (or (not (boundp 'dired-dotfiles-show-p)) dired-dotfiles-show-p) ; if currently showing
	(progn 
	  (set (make-local-variable 'dired-dotfiles-show-p) nil)
	  (message "h")
	  (dired-mark-files-regexp "^\\\.")
	  (dired-do-kill-lines))
      (progn (revert-buffer) ; otherwise just revert to re-show
	     (set (make-local-variable 'dired-dotfiles-show-p) t)))))

;; ----------------------------------------------------------------------
;; DiredReuseDirectoryBuffer
;; https://www.emacswiki.org/emacs/DiredReuseDirectoryBuffer
(put 'dired-find-alternate-file 'disabled nil)

;; we want dired not not make always a new buffer if visiting a directory
;; but using only one dired buffer for all directories.
;;(defadvice dired-advertised-find-file (around dired-subst-directory activate)
;;  "Replace current buffer if file is a directory."
;;  (interactive)
;;  (let ((orig (current-buffer))
;;	(filename (dired-get-filename)))
;;    ad-do-it
;;    (when (and (file-directory-p filename)
;;	       (not (eq (current-buffer) orig)))
;;                    (kill-buffer orig))))

;; Using the advising methods above will still create a new buffer if you invoke ^ (dired-up-directory). To prevent this:
;;(eval-after-load "dired"
;;  ;; don't remove `other-window', the caller expects it to be there
;;  '(defun dired-up-directory (&optional other-window)
;;     "Run Dired on parent directory of current directory."
;;     (interactive "P")
;;     (let* ((dir (dired-current-directory))
;;	    (orig (current-buffer))
;;	    (up (file-name-directory (directory-file-name dir))))
;;       (or (dired-goto-file (directory-file-name dir))
;;	   ;; Only try dired-goto-subdir if buffer has more than one dir.
;;	   (and (cdr dired-subdir-alist)
;;		(dired-goto-subdir up))
;;	   (progn
;;	     (kill-buffer orig)
;;	     (dired up)
;;	          (dired-goto-file dir))))))
;;
