;; ~/.emacs.d/init.el
;;----------------------------------------------------------------------
;; emacs -l init.el で起動された場合、init.elのあるディレクトリを .emacs.d と
;; みなすように変更する。
(when load-file-name
  (setq user-emacs-directory (file-name-directory load-file-name)))

;;----------------------------------------------------------------------
;; add ~/.emacs.d/lisp to load-path 
(add-to-list 'load-path (locate-user-emacs-file "lisp"))

;;----------------------------------------------------------------------
(setq inhibit-startup-message t)

(if (>= emacs-major-version 24)
    (add-hook 'after-init-hook (lambda () (load-theme 'molokai t))))

(if (not (file-directory-p "~/.cache/emacs"))
    (make-directory "~/.cache/emacs" t))

(if (not (file-directory-p "~/.cache/emacs/auto-save-list"))
    (make-directory "~/.cache/emacs/auto-save-list" t))
(setq auto-save-list-file-prefix "~/.cache/emacs/auto-save-list/.saves-")

;; save minibuffer history
(if (file-directory-p "~/.cache/emacs")
    (progn
      (savehist-mode 1)
      (setq savehist-file "~/.cache/emacs/savehist")))

;; S-*でハイライトしたregionをkill-ring書き換え無しに置き換え可能にする
(delete-selection-mode t)

(setq completion-ignore-case t)
(setq read-buffer-completion-ignore-case t)
(setq read-file-name-completion-ignore-case t)

;; ----------------------------------------------------------------------
;; Language
(setq lang (getenv "LANG"))
(if (<= emacs-major-version 22)
    (set-language-environment "Japanese"))

(cond
 ((>= emacs-major-version 22) ; Emacs22 or later
  (progn 
    (if (or (equal lang "ja_JP.eucJP")
	    (equal lang "ja_JP.ujis")
	    (equal lang "ja_JP.EUC")
	    (equal lang "japanese.euc"))
	(progn (prefer-coding-system 'euc-jp-unix))
      (progn (prefer-coding-system 'utf-8)))
    (setq transient-mark-mode nil)
    (setq mouse-yank-at-point t)
    ;;	   (set-locale-environment nil)
    ;;	   (show-paren-mode t)
    (menu-bar-mode -1)))
 ((= emacs-major-version 22) ; Emacs22 only
  (progn
    ;; uncomment for CJK utf-8 support for non-Asian users
    (require 'un-define)
    ;; to convert kanji code, type C-x RET f
    (utf-translate-cjk-mode t)))
 ((<= emacs-major-version 21) ; Emacs21 or before
    (progn
    (require 'un-define)
    (load "term/keyswap" t))))

;;----------------------------------------------------------------------
;; package.el
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.

(setq package-check-signature nil)
;(setq package-enable-at-startup nil)

(cond ((<= emacs-major-version 23)
       (add-to-list 'load-path (locate-user-emacs-file "lisp/package"))
       (when (require 'package nil t)
	 (package-initialize)))
      (t
       ;; Added by Package.el.  This must come before configurations of
       ;; installed packages.  Don't delete this line.  If you don't want it,
       ;; just comment it out by adding a semicolon to the start of the line.
       ;; You may delete these explanatory comments.
       (package-initialize t)))

(add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/") t)
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
;;(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/") t)

;;----------------------------------------------------------------------
;; use-package.el
;; https://github.com/jwiegley/use-package

;; https://qiita.com/kai2nenobu/items/
;; if use-package does not exist, replace with dummy macro to avoid error.
(unless (require 'use-package nil t)
  (defmacro use-package (&rest args)))

(eval-when-compile
  ;; Following line is not needed if use-package.el is in ~/.emacs.d
  (add-to-list 'load-path (locate-user-emacs-file "elpa"))
  (require 'use-package nil t)
)

;;----------------------------------------------------------------------
;; init-loader
(when (require 'init-loader nil t)
;;  (setq init-loader-show-log-after-init nil)
  (setq init-loader-show-log-after-init 'error-only)
  (setq init-loader-byte-compile t)
  (init-loader-load))

;;
;; hostごとの設定があれば読み込む
;;
(setq init-host (concat "~/.emacs.d/local/" (system-name) ".el"))
(if (file-readable-p init-host) (load-file init-host))

;;----------------------------------------------------------------------
;; change customize file (ファイル末尾でないと機能しない?)
(setq custom-file (locate-user-emacs-file "custom.el"))
;;(add-hook 'kill-emacs-query-functions
;;          'custom-prompt-customize-unsaved-options)

(if (file-readable-p custom-file)
    (load custom-file t nil nil))

;;----------------------------------------------------------------------
;; Local variables:
;; mode: Emacs-Lisp
;; End:
;;
