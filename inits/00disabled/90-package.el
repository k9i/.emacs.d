;; -*- Emacs-Lisp -*-

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

;; (setq package-archives
;; '(("gnu" . "http://elpa.gnu.org/packages/")
;;        ("melpa" . "http://melpa.org/packages/")
;; ("org" . "http://orgmode.org/elpa/")))

(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
