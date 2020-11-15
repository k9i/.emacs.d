;; -*- Emacs-Lisp -*-

(use-package company
;;  :disabled t
;;  :mode
;;  (("\\.sh$" . company-mode)
;;   ("\\.md$" . company-mode)
;;   ("\\.el$" . company-mode)
;;   ("\\.ya?ml$" . company-mode))

  :init
  (add-hook 'after-init-hook 'global-company-mode)

  :config
  (setq company-transformers '(company-sort-by-backend-importance)) ;; ソート順
  ;;(setq company-idle-delay 0) ; デフォルトは0.5
  ;;(setq company-minimum-prefix-length 3) ; デフォルトは4
  (setq company-selection-wrap-around t) ; 候補の一番下でさらに下に行こうとすると一番上に戻る
  (setq completion-ignore-case t)
  (setq company-dabbrev-downcase nil)

  :bind
  (("C-M-i" . company-complete)
   :map company-active-map
   ("C-n" . company-select-next) ;; C-n, C-pで補完候補を次/前の候補を選択
   ("C-p" . company-select-previous)
   :map company-search-map
   ("C-n" . company-select-next)
   ("C-p" . company-select-previous)
   :map company-active-map
   ("C-s" . company-filter-candidates) ;; C-sで絞り込む
   ("C-i" . company-complete-selection) ;; TABで候補を設定
   ;;([tab] . company-complete-selection) ;; TABで候補を設定
   ("C-f" . company-complete-selection) ;; C-fで候補を設定
   :map emacs-lisp-mode-map
   ("C-M-i" . company-complete) ;; 各種メジャーモードでも C-M-iで company-modeの補完を使う
   )
  )

;; (global-set-key (kbd "C-M-i") 'company-complete)
;; (define-key company-active-map (kbd "C-n") 'company-select-next) ;; C-n, C-pで補完候補を次/前の候補を選択
;; (define-key company-active-map (kbd "C-p") 'company-select-previous)
;; (define-key company-search-map (kbd "C-n") 'company-select-next)
;; (define-key company-search-map (kbd "C-p") 'company-select-previous)
;; (define-key company-active-map (kbd "C-s") 'company-filter-candidates) ;; C-sで絞り込む
;; (define-key company-active-map (kbd "C-i") 'company-complete-selection) ;; TABで候補を設定
;; (define-key company-active-map [tab] 'company-complete-selection) ;; TABで候補を設定
;; (define-key company-active-map (kbd "C-f") 'company-complete-selection) ;; C-fで候補を設定
;; (define-key emacs-lisp-mode-map (kbd "C-M-i") 'company-complete) ;; 各種メジャーモードでも C-M-iで company-modeの補完を使う
