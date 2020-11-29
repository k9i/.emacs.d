
;; ここに使っているパッケージを書く。
;; use-package.el 経由でインストールするpackageは記述不要。
;; M-x eval-buffer
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
     recently
     company
     counsel
     swiper
     )
  "packages to be installed")

;;------------------------
;; use-package.el でinstall (inits/50-*.el)
;;    buffer-flip
;;    docker
;;    eww
;;    smartrep

;;------------------------
(require 'package)
;;(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
;;(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/") t)
;;(package-initialize)

;; update package information
(unless package-archive-contents (package-refresh-contents))

;; install package in my-favorite-package-list, if not installed
(dolist (pkg my-favorite-package-list)
  (unless (package-installed-p pkg)
    (package-install pkg)))
