;; -*- Emacs-Lisp -*-

(use-package highlight-symbol
  :disabled t
  :if (locate-library "highlight-symbol")
  ;;:defer t
  :init
  ;;(add-hook 'ruby-mode-hook 'highlight-symbol-mode)
  (add-hook 'prog-mode-hook 'highlight-symbol-mode)
  (add-hook 'prog-mode-hook 'highlight-symbol-nav-mode)
  :config
  ;; highlight-symbolの設定
  (setq highlight-symbol-idle-delay 0.5) ;; highlight after 0.5s idle
  )
