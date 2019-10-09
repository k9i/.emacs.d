
    ;; ここに使っているパッケージを書く。
    ;; C-u 0 M-: (変数名?)
(defvar my-favorite-package-list
  '(use-package
    buffer-flip
    which-key
    markdown-mode
    json-mode
    yaml-mode
    terraform-mode
    dockerfile-mode
    docker-tramp
    ;; eww
    magit
    treemacs
    )
  "packages to be installed")

;;------------------------
;; use-package.el でinstall (inits/50-*.el)
;;    buffer-flip
;;    docker
;;    eww
;;    smartrep

;;------------------------
;;(require 'package)
;;(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
;;(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/") t)
;;(package-initialize)

(unless package-archive-contents (package-refresh-contents))
(dolist (pkg my-favorite-package-list)
  (unless (package-installed-p pkg)
    (package-install pkg)))
