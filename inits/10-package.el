;; -*- Emacs-Lisp -*-
;;----------------------------------------------------------------------
;; package.el

;; usage:
;; M-x package-list-package
;; i to select package to install.
;; x to install selected packages.
;;
;; no internet connection: M-x package-list-packages-no-feteh

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
       (package-initialize)))

(add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/") t)
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)

;;(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/") t)
