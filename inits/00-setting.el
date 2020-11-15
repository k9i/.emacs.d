;; -*- Emacs-Lisp -*-

;; always use space to indent
;;(setq-default indent-tabs-mode nil)
;; for dockerfile-mode to obey
;;(setq-default indent-tabs-mode nil tab-width 4)
;; -> Use: # -*- mode:Conf; tab-width:4 -*-

;; Always Use `y-or-n-p', Never `yes-or-no-p'
(defalias 'yes-or-no-p 'y-or-n-p)

;; default to unified diffs
(setq diff-switches '("-u" "-N"))

;; 対応する括弧をハイライト
(setq show-paren-delay 0.15)  ;; default 0.15s
(show-paren-mode t)

;; 編集時 buffer 再読み込み
(global-auto-revert-mode 1)

;; save-buffer 時，buffer 末尾に空行が常にあるように
;;(setq require-final-newline t)

;; シンボリックリンクの読み込みを許可
(setq vc-follow-symlinks t)
;; シンボリックリンク先のVCS内で更新が入った場合にバッファを自動更新
(setq auto-revert-check-vc-info t)

;; linum-mode をいじって Emacs を高速化
(setq linum-delay t)
(setq linum-format "%3d ")
(global-set-key "\C-x\C-l" 'linum-mode)
(defadvice linum-schedule (around my-linum-schedule () activate)
  (run-with-idle-timer 0.2 nil #'linum-update-current))

;; カーソルの位置が何文字目かを表示する
(column-number-mode t)

;; 特別に長い行があっても現在の行番号を知りたい
(setq line-number-display-limit-width 10000)

;; persist shell-command history
(savehist-mode t)
