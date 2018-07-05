; -*- Emacs-Lisp -*-
;; ~/.emacs.d/init.el
;;
(set-language-environment "Japanese")
(setq auto-save-list-file-prefix "~/.cache/emacs/auto-save-list/.saves-")
(setq inhibit-startup-message t)

;; S-*でハイライトしたregionをkill-ring書き換え無しに置き換え可能にする
;; Tips: "C-x SPC" でいつでも rectangle selection へ切替が可能
(delete-selection-mode 1)

;;(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/emacs-color-theme-solarized")
;;(load-theme 'solarized-dark t) ;; または　(load-theme 'solarized-light t)

; (cond (window-system
;        (add-to-list 'load-path "~/.emacs.d/oblivion-emacs-master")
;       (require 'color-theme-oblivion)
;       (color-theme-oblivion)))

;;----------------------------------------------------------------------
;; for package.el

;; usage:
;; M-x package-list-package
;; i to select package to install.
;; x to install selected packages.
;;
;; no internet connection: M-x package-list-packages-no-feteh

(when (< emacs-major-version 24)
  (add-to-list 'load-path (locate-user-emacs-file "lisp/package"))
  (require 'package))

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))

;;----------------------------------------------------------------------
;; emacs -l init.el で起動された場合、init.elのあるディレクトリを .emacs.d と
;; みなすように変更する。
(when load-file-name
  (setq user-emacs-directory (file-name-directory load-file-name)))

;;----------------------------------------------------------------------
;; add ~/.emacs.d/lisp to load-path 
(add-to-list 'load-path (locate-user-emacs-file "lisp"))

;;----------------------------------------------------------------------
;; init-loader
(require 'init-loader)
(setq init-loader-show-log-after-init nil)
(init-loader-load)

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


;;----------------------------------------------------------------------
;;
;; http://www.kmc.gr.jp/~tak/memo/emacs-local-variable.html
;;
;;----------------------------------------------------------------------
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-comment-face ((((class grayscale color) (background dark)) (:foreground "red"))) t)
 '(custom-comment-tag ((((class color) (background light)) (:foreground "cyan"))))
 '(custom-group-tag ((((class color) (background light)) (:inherit variable-pitch :foreground "cyan" :weight bold :height 1.2))))
 '(font-lock-builtin-face ((((type tty) (class color)) (:foreground "cyan" :weight light))))
 '(font-lock-comment-face ((((type tty pc) (class color) (background dark)) (:foreground "green"))))
 '(font-lock-function-name-face ((((type tty) (class color)) (:foreground "cyan" :weight bold))))
 '(font-lock-warning-face ((((type tty) (class color)) (:foreground "magenta"))))
 '(fringe ((((class color) (background light)) (:background "grey95"))))
 '(highlight ((((type tty) (class color)) (:background "green" :foreground "blue"))))
 '(isearch ((((type tty pc) (class color)) (:background "magenta4" :foreground "blue"))))
 '(lazy-highlight ((((type tty pc) (class color)) (:foreground "magenta4"))))
 '(minibuffer-prompt ((t (:foreground "cyan"))))
 '(w3-style-face-00002 ((t (:foreground "#000000" :underline nil :weight normal :family "fixed"))))
 '(w3-style-face-00003 ((t (:foreground "#0000ff" :underline nil :weight normal :family "fixed"))))
 '(w3-style-face-00004 ((t (:foreground "#840084" :underline nil :weight normal :family "fixed"))))
 '(w3-style-face-00005 ((t (:foreground "#000000" :underline nil :weight bold :height 400 :family "new century schoolbook"))))
 '(w3-style-face-00006 ((t (:foreground "#0000ff" :underline nil :weight bold :height 400 :family "new century schoolbook"))))
 '(w3-style-face-00007 ((t (:foreground "#840084" :underline nil :weight bold :height 400 :family "new century schoolbook"))))
 '(w3-style-face-00008 ((t (:foreground "#000000" :underline nil :weight bold :height 300 :family "new century schoolbook"))))
 '(w3-style-face-00009 ((t (:foreground "#000000" :underline nil :weight bold :family "fixed"))))
 '(w3-style-face-00010 ((t (:foreground "#0000ff" :underline nil :weight bold :family "fixed"))))
 '(w3-style-face-00011 ((t (:foreground "#840084" :underline nil :weight bold :family "fixed"))))
 '(w3-style-face-00014 ((t (:foreground "#000000"))))
 '(w3-style-face-00015 ((t (:foreground "#000000"))))
 '(widget-field ((((type tty)) (:background "blue"))))
 '(widget-single-line-field ((((type tty)) (:background "blue")))))


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#212526" "#ff4b4b" "#b4fa70" "#fce94f" "#729fcf" "#e090d7" "#8cc4ff" "#eeeeec"])
 '(column-number-mode t)
 '(display-time-mode t)
 '(package-selected-packages
   (quote
    (dired-toggle atom-one-dark-theme which-key package-utils zenburn-theme magit yaml-mode)))
 '(show-paren-mode t)
 '(size-indication-mode t)
 '(tool-bar-mode nil)
 '(transient-mark-mode nil))
;;
;; Local variables:
;; mode: Emacs-Lisp
;; End:
;;
