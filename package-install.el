
(defvar my-favorite-package-list
  '(
    ;; ここに使っているパッケージを書く。
    ;; C-u 0 M-: (変数名?)

    browse-kill-ring
    buffer-flip
    dockerfile-mode
    docker-tramp
    magit
    markdown-mode
    buffer-flip
    use-package
    which-key
    yaml-mode
    )
  "packages to be installed")

;;(require 'package)
;;(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
;;(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/") t)
;;(package-initialize)

(unless package-archive-contents (package-refresh-contents))
(dolist (pkg my-favorite-package-list)
  (unless (package-installed-p pkg)
    (package-install pkg)))
