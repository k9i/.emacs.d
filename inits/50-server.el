;; -*- Emacs-Lisp -*-

(use-package server
  :config
  (setq server-socket-dir
        (let ((xdg_runtime_dir (getenv "XDG_RUNTIME_DIR")))
	  (if xdg_runtime_dir
	      (format "%s/emacs-%s" xdg_runtime_dir (emacs-pid))
	    (format "%s/emacs%d" (or (getenv "TMPDIR") "/tmp") (user-uid)))))
)
