;; -*- Emacs-Lisp -*-

(use-package ace-isearch
  :disabled t
  :init
  (global-ace-isearch-mode +1)
  :bind
  (:map isearch-mode-map
        ("C-'" . ace-isearch-jump-during-isearch)
        ("C-:" . ace-isearch-jump-during-isearch)
        ("C-i" . ace-isearch-jump-during-isearch)
  )
  :config
  (setq ace-isearch-input-length 4)
)
