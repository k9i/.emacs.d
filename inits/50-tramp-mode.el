;; -*- Emacs-Lisp -*-

;; Disable git backend to speed up sshfs file load among other things
(setq vc-handled-backends (quote (RCS CVS SVN SCCS Bzr Hg Mtn Arch)))

;; workaround hang up on alpine docker
(use-package docker-tramp-compat)
