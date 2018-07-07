(require 'color)
(require 'solarized-definitions)

(defun my-mix-colors (color1 color2 percent)
  (cl-destructuring-bind ((r g b) rr gg bb)
      (cons (color-name-to-rgb color1) (color-name-to-rgb color2))
    (let* ((x (/ percent 100.0)) (y (- 1 x)))
      (color-rgb-to-hex (+ (* r y) (* rr x)) (+ (* g y) (* gg x)) (+ (* b y) (* bb x))))))

(defmacro create-solarized-based-theme
  (name mode darkest-base brightest-base yellow orange red magenta violet blue cyan green)
  (declare (indent 2))
  (let* ((solarized-colors
          `((base03  ,darkest-base)
            (base02  ,(my-mix-colors darkest-base brightest-base 3))
            (base01  ,(my-mix-colors darkest-base brightest-base 35))
            (base00  ,(my-mix-colors darkest-base brightest-base 40))
            (base0   ,(my-mix-colors darkest-base brightest-base 52))
            (base1   ,(my-mix-colors darkest-base brightest-base 58))
            (base2   ,(my-mix-colors darkest-base brightest-base 95))
            (base3   ,brightest-base)
            (yellow ,yellow) (orange ,orange) (red ,red) (magenta ,magenta)
            (violet ,violet) (blue ,blue) (cyan ,cyan) (green ,green)))
         (defs (solarized-color-definitions mode))
         (theme-vars (mapcar (lambda (def) (list (car def) (cdr def))) (second defs)))
         (theme-faces (first defs)))
    `(progn
       (deftheme ,name)
       (apply 'custom-theme-set-variables ',name ',theme-vars)
       (apply 'custom-theme-set-faces ',name ',theme-faces)
       (provide-theme ',name))))

(create-solarized-based-theme
 solarized-jellybeans ;; テーマの名前
 dark                 ;; dark または light
 "#202020"            ;; 一番暗い色
 "#ffffff"            ;; 一番明るい色
 ;; ハイライト色×８
 "#ffb964" "#8fbfdc" "#a04040" "#b05080" "#805090" "#fad08a" "#99ad6a" "#8fbfdc")
