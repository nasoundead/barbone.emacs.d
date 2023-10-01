(setq fonts
    (cond ((eq system-type 'darwin)     '("Monaco"    "STHeiti"))
            ((eq system-type 'gnu/linux)  '("Ubuntu Mono"     "WenQuanYi Micro Hei Mono"))
            ;; ((eq system-type 'windows-nt) '("JetBrains Mono"  "宋体"))
            ;; ((eq system-type 'windows-nt) '("Monaco Nerd Font"  "宋体"))
            ;; ((eq system-type 'windows-nt) '("Iosevka"  "宋体"))
            ((eq system-type 'windows-nt) '("Fira Code"  "宋体"))
            ;; ((eq system-type 'windows-nt) '("JetBrainsMono Nerd Font"  "宋体"))
            ;; ((eq system-type 'windows-nt) '("Inconsolata NFM"  "宋体"))
            ;; ((eq system-type 'windows-nt) '("Source Code Pro"  "Microsoft Yahei"))
            ;; ((eq system-type 'windows-nt) '("Cascadia Code"  "Microsoft Yahei"))
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

(global-set-key (kbd "M-=") #'text-scale-increase)
(global-set-key (kbd "M--") #'text-scale-decrease)

(provide 'init-font)
