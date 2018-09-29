; -*- Emacs-Lisp -*-
;; ~/.emacs.d/init.el
;;
;;----------------------------------------------------------------------
;; emacs -l init.el で起動された場合、init.elのあるディレクトリを .emacs.d と
;; みなすように変更する。
(when load-file-name
  (setq user-emacs-directory (file-name-directory load-file-name)))

;;----------------------------------------------------------------------
;; add ~/.emacs.d/lisp to load-path 
(add-to-list 'load-path (locate-user-emacs-file "lisp"))

;;----------------------------------------------------------------------
(set-language-environment "Japanese")
(setq auto-save-list-file-prefix "~/.cache/emacs/auto-save-list/.saves-")
(setq inhibit-startup-message t)

;; S-*でハイライトしたregionをkill-ring書き換え無しに置き換え可能にする
(delete-selection-mode t)

(setq completion-ignore-case t)
(setq read-buffer-completion-ignore-case t)
(setq read-file-name-completion-ignore-case t)

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
;; autoload-if-found from: http://www.sodan.org/~knagano/emacs/dotemacs.html
;; * init-loader内のファイルはエラーでも読み込み停止しないので、必須ではない。
;; 使い方 引数は autoload と全く同じです。-if-found を付けるだけ
;;;;(when (autoload-if-found 'bs-show "bs" "buffer selection" t)
;;;;; autoload は成功した場合のみ non-nil を返すので、
;;;; when の条件部に置くことで、依存関係にある設定項目を自然に表現できます。
;;  (global-set-key [(control x) (control b)] 'bs-show)
;;    (setq bs-max-window-height 10))
(defun autoload-if-found (function file &optional docstring interactive type)
  "set autoload iff. FILE has found."
  (and (locate-library file)
       (autoload function file docstring interactive type)))

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
(if (file-exists-p init-host) (load-file init-host))

;;----------------------------------------------------------------------
;; change customize file (ファイル末尾でないと機能しない?)
(setq custom-file (locate-user-emacs-file "custom.el"))
(add-hook 'kill-emacs-query-functions
          'custom-prompt-customize-unsaved-options)

(if (file-exists-p custom-file)
    (load custom-file t nil nil))

;;----------------------------------------------------------------------
;; http://www.kmc.gr.jp/~tak/memo/emacs-local-variable.html
;;
;;----------------------------------------------------------------------
;; Local variables:
;; mode: Emacs-Lisp
;; End:
;;
