;;(when (>= emacs-major-version 24)
;;  (require 'which-key)
;;  ;;; 3つの表示方法どれか1つ選ぶ
;;  (which-key-setup-side-window-bottom)    ;ミニバッファ
;;  ;; (which-key-setup-side-window-right)     ;右端
;;  ;; (which-key-setup-side-window-right-bottom) ;両方使う
;;  (which-key-mode 1))

(use-package which-key
  :ensure t
  :config
  (which-key-setup-side-window-bottom)    ;ミニバッファ
  ;;(which-key-setup-side-window-right)     ;右端 (ターミナルではスペースが不足)
  (setq which-key-idle-delay 3.0)
  (setq which-key-idle-secondary-delay 0.05)
  (which-key-mode 1))
