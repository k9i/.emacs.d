; -*- Emacs-Lisp -*-
;; ~/.emacs.d/init.el
;;
(setq custom-file (locate-user-emacs-file "custom.el"))
(set-language-environment "Japanese")
(setq auto-save-list-file-prefix "~/.cache/emacs/auto-save-list/.saves-")
(setq inhibit-startup-message t)

;; S-*でハイライトしたregionをkill-ring書き換え無しに置き換え可能にする
(delete-selection-mode t)

;; 
(setq completion-ignore-case t)
(setq read-buffer-completion-ignore-case t)
(setq read-file-name-completion-ignore-case t)

;;----------------------------------------------------------------------
;; for package.el

;; usage:
;; M-x package-list-package
;; i to select package to install.
;; x to install selected packages.
;;
;; no internet connection: M-x package-list-packages-no-feteh

(cond ((<= emacs-major-version 23)
       (add-to-list 'load-path (locate-user-emacs-file "lisp/package"))
       (when (require 'package nil t)
	 (package-initialize)))
      (t
       ;; Added by Package.el.  This must come before configurations of
       ;; installed packages.  Don't delete this line.  If you don't want it,
       ;; just comment it out by adding a semicolon to the start of the line.
       ;; You may delete these explanatory comments.
       (package-initialize)))

(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
;;(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))
;; (add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))

;;----------------------------------------------------------------------
;; emacs -l init.el で起動された場合、init.elのあるディレクトリを .emacs.d と
;; みなすように変更する。
(when load-file-name
  (setq user-emacs-directory (file-name-directory load-file-name)))

;;----------------------------------------------------------------------
;; add ~/.emacs.d/lisp to load-path 
(add-to-list 'load-path (locate-user-emacs-file "lisp"))

;;----------------------------------------------------------------------
;; autoload-if-found from: http://www.sodan.org/~knagano/emacs/dotemacs.html
;; init-loader内のファイルはエラーでも読み込み停止しない。
(defun autoload-if-found (function file &optional docstring interactive type)
  "set autoload iff. FILE has found."
  (and (locate-library file)
       (autoload function file docstring interactive type)))
;; 使い方
;; 引数は autoload と全く同じです。-if-found を付けるだけ
;;;;(when (autoload-if-found 'bs-show "bs" "buffer selection" t)
;;;;; autoload は成功した場合のみ non-nil を返すので、
;;;; when の条件部に置くことで、依存関係にある設定項目を自然に表現できます。
;;  (global-set-key [(control x) (control b)] 'bs-show)
;;    (setq bs-max-window-height 10))

;;----------------------------------------------------------------------
;; init-loader
(when (require 'init-loader nil t)
  (setq init-loader-show-log-after-init nil)
  (init-loader-load))

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
;; Local variables:
;; mode: Emacs-Lisp
;; End:
;;
