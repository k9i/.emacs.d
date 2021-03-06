 ;; -*- Emacs-Lisp -*-

(use-package eww
  :defer t
  :commands eww
  :init
  ;; default to google
  (setq eww-search-prefix "https://www.google.com/search?q=")
  ;; 現在の url を eww で開く
  (defun browse-url-with-eww ()
  (interactive)
  (let ((url-region (bounds-of-thing-at-point 'url)))
    ;; url
    (if url-region
      (eww-browse-url (buffer-substring-no-properties (car url-region)
                              (cdr url-region))))
    ;; org-link
    (setq browse-url-browser-function 'eww-browse-url)
    (org-open-at-point)))
  (global-set-key (kbd "C-c C-o") 'browse-url-with-eww)

  ;; Usage from info
  ;; - q  leave EWW by pressing ‘q’ (eww-quit)
  ;; - g  reload the web page hit ‘g’ (eww-reload)
  ;; - w  copy the current URL to the kill ring.‘w’ (‘eww-copy-page-url’)
  ;; - R  (‘eww-readable’)  “readable” text
  ;; - F  (‘eww-toggle-fonts’) toggles whether to use variable-pitch fonts or not.  This sets the ‘shr-use-fonts’ variable.
  ;; - d  A URL under the point can be downloaded with ‘d’ (‘eww-download’).
  ;;      The file will be written to the directory specified in ‘eww-download-directory’ (Default: ‘~/Downloads/’).
  ;; - v  view source

  ;; customize
  ;; - c  (eww-toggle-colors) toggles whether to use HTML-specified colors or not.  This sets the ‘shr-use-colors’ variable.

  :bind
  (:map eww-mode-map
	      ("r" . eww-reload)
	      ("c" . eww-toggle-colors)
	      ;;("c 0" 'eww-copy-page-url)
	      ;;("p" 'scroll-down)
	      ;;("n" 'scroll-up)
	      ("c" . eww-toggle-colors)
	      ("p" . scroll-down-command)
	      ("n" . scroll-up-command)
	      ("h" . left-char)
	      ("j" . next-line)
	      ("k" . previous-line)
	      ("l" . right-char)
	      ("b" . eww-back-url)
	      ("f" . eww-forward-url)
	      ("R" . eww-reload)
	      ("h" . backward-char)
	      ("j" . next-line)
	      ("k" . previous-line)
	      ("l" . forward-char)
	      ("J" . View-scroll-line-forward)  ;; カーソルは移動せず、画面がスクロースする
	      ("K" . View-scroll-line-backward)
	      ;;	     ("P" . previous-buffer)
	      ;;	     ("N" . next-buffer)
	      )

  :config
  (setq browse-url-browser-function 'eww-browse-url)
  (define-key eww-mode-map "r" 'eww-reload)
;;  (define-key eww-mode-map "c" 'eww-toggle-colors)
;;  ;;(define-key eww-mode-map "c 0" 'eww-copy-page-url)
;;  ;;(define-key eww-mode-map "p" 'scroll-down)
;;  ;;(define-key eww-mode-map "n" 'scroll-up)
;;  (define-key eww-mode-map "c" 'eww-toggle-colors)
;;  (define-key eww-mode-map "p" 'scroll-down-command)
;;  (define-key eww-mode-map "n" 'scroll-up-command)
;;  (define-key eww-mode-map "h" 'left-char)
;;  (define-key eww-mode-map "j" 'next-line)
;;  (define-key eww-mode-map "k" 'previous-line)
;;  (define-key eww-mode-map "l" 'right-char)
;;  (define-key eww-mode-map "b" 'eww-back-url)
;;  (define-key eww-mode-map "f" 'eww-forward-url)
;;  (define-key eww-mode-map "r" 'eww-reload)

  ;; https://futurismo.biz/archives/2950/
  (defvar eww-disable-colorize t)
  (defun shr-colorize-region--disable (orig start end fg &optional bg &rest _)
    (unless eww-disable-colorize
      (funcall orig start end fg)))
  (advice-add 'shr-colorize-region :around 'shr-colorize-region--disable)
  (advice-add 'eww-colorize-region :around 'shr-colorize-region--disable)
  (defun eww-disable-color ()
    "eww で文字色を反映させない"
    (interactive)
    (setq-local eww-disable-colorize t)
    (eww-reload))
  (defun eww-enable-color ()
    "eww で文字色を反映させる"
    (interactive)
    (setq-local eww-disable-colorize nil)
    (eww-reload))

  ;; 画像を非表示
  (defun eww-disable-images ()
    "eww で画像表示させない"
    (interactive)
    (setq-local shr-put-image-function 'shr-put-image-alt)
    (eww-reload))
  (defun eww-enable-images ()
    "eww で画像表示させる"
    (interactive)
    (setq-local shr-put-image-function 'shr-put-image)
    (eww-reload))
  (defun shr-put-image-alt (spec alt &optional flags)
    (insert alt))
  ;; はじめから非表示
  (defun eww-mode-hook--disable-image ()
    (setq-local shr-put-image-function 'shr-put-image-alt))
  (add-hook 'eww-mode-hook 'eww-mode-hook--disable-image)

  )
