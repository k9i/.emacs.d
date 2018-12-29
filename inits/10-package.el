;;----------------------------------------------------------------------
;; package.el

;; usage:
;; M-x package-list-package
;; i to select package to install.
;; x to install selected packages.
;;
;; no internet connection: M-x package-list-packages-no-feteh

(setq package-check-signature nil)

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