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
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector
   (vector "#ffffff" "#f36c60" "#8bc34a" "#fff59d" "#4dd0e1" "#b39ddb" "#81d4fa" "#262626"))
 '(company-quickhelp-color-background "#4F4F4F")
 '(company-quickhelp-color-foreground "#DCDCCC")
 '(compilation-message-face (quote default))
 '(cua-global-mark-cursor-color "#2aa198")
 '(cua-normal-cursor-color "#839496")
 '(cua-overwrite-cursor-color "#b58900")
 '(cua-read-only-cursor-color "#859900")
 '(custom-enabled-themes (quote (molokai)))
 '(custom-safe-themes
   (quote
    ("fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" "78496062ff095da640c6bb59711973c7c66f392e3ac0127e611221d541850de2" "cd03a600a5f470994ba01dd3d1ff52d5809b59b4a37357fa94ca50a6f7f07473" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "190a9882bef28d7e944aa610aa68fe1ee34ecea6127239178c7ac848754992df" "ace7afb1ca129b605713ff4a8f9c1269940b8b360c4f305b79c8157ac842464f" "bcc6775934c9adf5f3bd1f428326ce0dcd34d743a92df48c128e6438b815b44f" "8db4b03b9ae654d4a57804286eb3e332725c84d7cdab38463cb6b97d5762ad26" "415cb7293497da4a287aae6017643d554dbbaa49ba410c50b5d75cee123c4f17" "95b0bc7b8687101335ebbf770828b641f2befdcf6d3c192243a251ce72ab1692" "def610e6d1739e5518b29ca660962905b767aeeee396a71ddcd3a41fbfd2dd28" "dfcf858acee06834f9332f0c1660e15204ca84507b30c0723bd25fbeff26e96b" "c3c0a3702e1d6c0373a0f6a557788dfd49ec9e66e753fb24493579859c8e95ab" "6b0d63ee94efc70d7ffccfd20f7618af0ad2a03900c439ff26a44ce8c2f735b9" "ea20028ea8def077127aec27b6e13a9b8e5c6a20c636c0b0d1dd1b4cd66cfdaf" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "a24c5b3c12d147da6cef80938dca1223b7c7f70f2f382b26308eba014dc4833a" "f39f2583c6aa9107d058c54067f62e30194b204fa35c8e8fc41fba7cc30f8ddc" "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" default)))
 '(fci-rule-color "#3a3a3a")
 '(highlight-changes-colors (quote ("#d33682" "#6c71c4")))
 '(highlight-symbol-colors
   (--map
    (solarized-color-blend it "#002b36" 0.25)
    (quote
     ("#b58900" "#2aa198" "#dc322f" "#6c71c4" "#859900" "#cb4b16" "#268bd2"))))
 '(highlight-symbol-foreground-color "#93a1a1")
 '(highlight-tail-colors
   (quote
    (("#073642" . 0)
     ("#546E00" . 20)
     ("#00736F" . 30)
     ("#00629D" . 50)
     ("#7B6000" . 60)
     ("#8B2C02" . 70)
     ("#93115C" . 85)
     ("#073642" . 100))))
 '(hl-bg-colors
   (quote
    ("#7B6000" "#8B2C02" "#990A1B" "#93115C" "#3F4D91" "#00629D" "#00736F" "#546E00")))
 '(hl-fg-colors
   (quote
    ("#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36")))
 '(hl-paren-colors (quote ("#2aa198" "#b58900" "#268bd2" "#6c71c4" "#859900")))
 '(hl-sexp-background-color "#121212")
 '(magit-diff-use-overlays nil)
 '(molokai-high-contrast-mode-line t)
 '(nrepl-message-colors
   (quote
    ("#dc322f" "#cb4b16" "#b58900" "#546E00" "#B4C342" "#00629D" "#2aa198" "#d33682" "#6c71c4")))
 '(package-selected-packages
   (quote
    (color-theme-solarized reverse-theme atom-one-dark-theme spacemacs-theme yaml-mode hc-zenburn-theme)))
 '(pdf-view-midnight-colors (quote ("#DCDCCC" . "#383838")))
 '(pos-tip-background-color "#073642")
 '(pos-tip-foreground-color "#93a1a1")
 '(smartrep-mode-line-active-bg (solarized-color-blend "#859900" "#073642" 0.2))
 '(solarized-termcolors 256)
 '(syslog-debug-face
   (quote
    ((t :background unspecified :foreground "#5FFFFF" :weight bold))))
 '(syslog-error-face
   (quote
    ((t :background unspecified :foreground "#FF1493" :weight bold))))
 '(syslog-hour-face (quote ((t :background unspecified :foreground "#87D700"))))
 '(syslog-info-face
   (quote
    ((t :background unspecified :foreground "#5FD7FF" :weight bold))))
 '(syslog-ip-face (quote ((t :background unspecified :foreground "#CDC673"))))
 '(syslog-su-face (quote ((t :background unspecified :foreground "#D700D7"))))
 '(syslog-warn-face
   (quote
    ((t :background unspecified :foreground "#FF8C00" :weight bold))))
 '(term-default-bg-color "#002b36")
 '(term-default-fg-color "#839496")
 '(vc-annotate-background nil)
 '(vc-annotate-background-mode nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#f36c60")
     (40 . "#ff9800")
     (60 . "#fff59d")
     (80 . "#8bc34a")
     (100 . "#81d4fa")
     (120 . "#4dd0e1")
     (140 . "#b39ddb")
     (160 . "#f36c60")
     (180 . "#ff9800")
     (200 . "#fff59d")
     (220 . "#8bc34a")
     (240 . "#81d4fa")
     (260 . "#4dd0e1")
     (280 . "#b39ddb")
     (300 . "#f36c60")
     (320 . "#ff9800")
     (340 . "#fff59d")
     (360 . "#8bc34a"))))
 '(vc-annotate-very-old-color nil)
 '(weechat-color-list
   (quote
    (unspecified "#002b36" "#073642" "#990A1B" "#dc322f" "#546E00" "#859900" "#7B6000" "#b58900" "#00629D" "#268bd2" "#93115C" "#d33682" "#00736F" "#2aa198" "#839496" "#657b83")))
 '(xterm-color-names
   ["#073642" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#eee8d5"])
 '(xterm-color-names-bright
   ["#002b36" "#cb4b16" "#586e75" "#657b83" "#839496" "#6c71c4" "#93a1a1" "#fdf6e3"]))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ediff-current-diff-A ((t (:foreground "cyan" :background "brown"))))
 '(ediff-current-diff-Ancestor ((t (:foreground "cyan" :background "brown")))))
;; Local variables:
;; mode: Emacs-Lisp
;; End:
;;
