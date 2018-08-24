;; -*- Emacs-Lisp -*-
;; ~/.emacs.d/inits/50-backup.el

;; disable backup
;; (setq make-backup-files nil)

;; create backup directory.
(if (not (file-exists-p "~/.local/share/Backup"))
    (let ((result (ignore-errors
                    (mkdir "~/.local/share/Backup" :parents)
                    t)))))

;; set backup directory.
(let ((target "~/.local/share/Backup"))
  ;; ssh-gw...
  (cond ((file-exists-p "~/work/dot_pika")
         (let ((result (ignore-errors
                         (mkdir "~/work/.local/share/Backup" :parents)))))
         (setq target "~/work/.local/share/Backup")))

  (setq backup-directory-alist
        (cons (cons "\\.*$" (expand-file-name target))
              backup-directory-alist)))

;; enable backup
(setq make-backup-files t)
