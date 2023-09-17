;; ;;;###autoload
;; (defun +evan/set-cn-fonts ()
;;   (interactive)
;;   (dolist (charset '(kana symbol cjk-misc bopomofo chinese-gbk))
;;     (set-fontset-font
;;      "fontset-default"
;;      charset
;;      (font-spec :name +evan/cn-font
;;                 :slant 'normal
;;                 :size +evan/cn-font-size))))
;; ;;;###autoload
;; (defun +evan/set-fonts ()
;;   (interactive)
;;   (when (window-system)
;;     (progn
;;       ;; 设置Emoji字体
;;       (let ((fonts '("Noto Color Emoji")))
;;         (cl-loop with script = (if (>= emacs-major-version 28)
;;         'emoji 'unicode)
;;                  for font in fonts
;;                  when (member font (font-family-list))
;;                  return (set-fontset-font t script (font-spec
;; 						    :family font) nil 'prepend)))
;;       ;; 设置default face字体
;;       (set-face-attribute
;;        'default nil
;;        :font (font-spec :family +evan/en-font
;;                         :weight 'medium
;; 			:width 'wide
;;                         :size +evan/font-size))
;;       ;; 设置fixed-pitch-serif face字体
;;       (set-face-attribute
;;        'fixed-pitch-serif nil
;;        :font (font-spec :family +evan/en-font
;;                         :weight 'normal
;;                         :slant 'italic
;;                         :size +evan/font-size))
;;       (set-face-attribute
;;        'fixed-pitch nil
;;        :font (font-spec :family +evan/en-font
;;                         :weight 'normal
;;                         :size +evan/font-size))
;;       (set-face-attribute
;;        'variable-pitch nil
;;        :font (font-spec :family +evan/en-font
;;                         :weight 'normal
;;                         :size +evan/font-size))



;;       (+evan/set-cn-fonts))))

;; (setq +evan/en-font "Monaco Nerd Font"
;;       +evan/cn-font "Microsoft Yahei"
;;       +evan/font-size 14.0
;;       +evan/cn-font-size 14.0)

;; ;;;###autoload
;; (defun +evan/toggle-big-font ()
;;   "切换大字体模式"
;;   (interactive)
;;   (if (> +evan/font-size 17.5)
;;       (setq +evan/font-size (- +evan/font-size 5)
;; 	    +evan/cn-font-size (- +evan/cn-font-size 5))
;;     (setq +evan/font-size (+ +evan/font-size 5)
;; 	  +evan/cn-font-size (+ +evan/cn-font-size 5)))
;;   (+evan/set-fonts)
;;   (+evan/set-cn-fonts))


(setq fonts
    (cond ((eq system-type 'darwin)     '("Monaco"    "STHeiti"))
            ((eq system-type 'gnu/linux)  '("Ubuntu Mono"     "WenQuanYi Micro Hei Mono"))
            ;; ((eq system-type 'windows-nt) '("JetBrains Mono"  "宋体"))
            ;; ((eq system-type 'windows-nt) '("Monaco Nerd Font"  "宋体"))
            ;; ((eq system-type 'windows-nt) '("Iosevka"  "Microsoft Yahei"))
            ;; ((eq system-type 'windows-nt) '("JetBrainsMono Nerd Font"  "宋体"))
            ;; ((eq system-type 'windows-nt) '("Inconsolata NFM"  "宋体"))
            ((eq system-type 'windows-nt) '("Source Code Pro"  "Microsoft Yahei"))
            ((eq system-type 'windows-nt) '("Cascadia Code"  "Microsoft Yahei"))
            ;; ((eq system-type 'windows-nt) '("SauceCodePro Nerd Font"  "宋体"))
            ))
(set-face-attribute 'default nil :font
    (format "%s:pixelsize=%d" (car fonts) 16))
(dolist (charset '(kana han symbol cjk-misc bopomofo))
    (set-fontset-font (frame-parameter nil 'font) charset
        (font-spec :family (car (cdr fonts)))))
;; Fix chinese font width and rescale
(setq face-font-rescale-alist '(("宋体". 1.0) ("Microsoft Yahei" . 1.2) ("WenQuanYi Micro Hei Mono" . 1.2) ("STHeiti". 1.2)))
(custom-set-faces
    '(org-table ((t (:family "Ubuntu Mono")))))


(when (display-graphic-p)
    (setq inhibit-compacting-font-caches t)
    (require 'all-the-icons))

(provide 'init-font)
