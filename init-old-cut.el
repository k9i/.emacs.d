;;----------------------------------------------------------------------
;; Emacsen
(defun x->bool (elt) (not (not elt)))
(defvar emacs19before-p (<= emacs-major-version 19))
(defvar emacs22-p (equal emacs-major-version 22))
(defvar emacs23-p (equal emacs-major-version 23))
(defvar emacs23later-p (>= emacs-major-version 23))
(defvar emacs24-p (equal emacs-major-version 24))
(defvar xemacs-p (string-match " XEmacs" emacs-version))
(defvar darwin-p (eq system-type 'darwin))
(defvar ns-p (featurep 'ns))
(defvar carbon-p (and (eq window-system 'mac) emacs22-p))
;(defvar mac-p (and (eq window-system 'mac) (or emacs23-p emacs24-p)))
(defvar mac-p (and (eq window-system 'mac) emacs23later-p))
(defvar linux-p (eq system-type 'gnu/linux))
(defvar colinux-p (when linux-p
                    (let ((file "/proc/modules"))
                      (and
                       (file-readable-p file)
                       (x->bool
                        (with-temp-buffer
                          (insert-file-contents file)
                          (goto-char (point-min))
                          (re-search-forward "^cofuse\.+" nil t)))))))
(defvar cygwin-p (eq system-type 'cygwin))
(defvar nt-p (eq system-type 'windows-nt))
(defvar meadow-p (featurep 'meadow))
(defvar windows-p (or cygwin-p nt-p meadow-p))
(defvar freebsd-p (eq system-type 'berkeley-unix))

;;----------------------------------------------------------------------
;; Emacs(Mule) version dependent comfigurations.
;;                                                                                                            
(cond (window-system
       (global-unset-key "\C-z")
       ))

(if (> emacs-major-version 21) ; Emacs22 or later
    (progn (load "init-key" t)
	   (prefer-coding-system 'utf-8)
	   (setq transient-mark-mode nil)
	   (setq mouse-yank-at-point t)
;	   (set-locale-environment nil)
;	   (show-paren-mode t)
	   (menu-bar-mode -1)))

(if (= emacs-major-version 22) ; Emacs22 only
    ;; to convert kanji code, type C-x RET f
    (utf-translate-cjk-mode t))

(if (<= emacs-major-version 21)
    (progn (load "term/keyswap" t)))

(if (boundp 'mule-version)
    (cond
     ((> emacs-major-version 21) ;Emacs22 or later
      (if (file-exists-p "~/.emacs.d/emacs22.el") (load "emacs22" t)))
     ((> emacs-major-version 19) ;Emacs21 or 20
      (if (file-exists-p "~/.emacs.d/emacs21.el") (load "emacs21" t)))
     ((= emacs-major-version 19) ;Emacs19(Mule)
      (menu-bar-mode -1)
      (if (file-exists-p "~/.emacs.d/emacs19-mule.el") (load "emacs19-mule" t)))
     ((and (boundp 'xemacs-p) (boundp 'emacs19before-p))
      (select-input-method "japanese-canna")
      (if (eq (console-type)  'x)
	  (set-face-font
	   'default
	   '("-*-fixed-medium-r-*--15-*-iso8859-*"
	     "-*-fixed-medium-r-*--14-*-jisx0201.1976-*"
	     "-*-fixed-medium-r-*--14-*-jisx0208.1983-*"
	     "-*-fixed-medium-r-*--14-*-jisx0212*-*")
	   'global  '(mule-fonts)  'prepend)))))

