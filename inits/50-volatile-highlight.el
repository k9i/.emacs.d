;; -*- Emacs-Lisp -*-

;; require する
(require 'volatile-highlight)

;; 使う
(volatile-highlight 1 10) ; 開始位置、終了位置
(volatile-highlight 1 10 2) ; 開始位置、終了位置、ハイライトさせる時間（秒）
