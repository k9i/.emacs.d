;; -*- Emacs-Lisp -*-

(use-package highlight-symbol
  :if (locate-library "highlight-symbol")
  :defer t
  :init
  (add-hook 'ruby-mode-hook 'highlight-symbol-mode)
  :config
  ;; highlight-symbolの設定
  )
