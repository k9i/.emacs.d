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

(cond ((< emacs-major-version 24)
       (add-to-list 'load-path (locate-user-emacs-file "lisp/package"))
       (require 'package)))

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
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



(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("80c44e00b3f8f38570015e09d76d60ee73e6bf2d3b8bdb82c2abf5765c038fdc" "ace7afb1ca129b605713ff4a8f9c1269940b8b360c4f305b79c8157ac842464f" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
 ;; Local variables:
;; mode: Emacs-Lisp
;; End:
;;
