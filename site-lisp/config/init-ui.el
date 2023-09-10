;; themes
;; (require 'doom-themes)
(setq +evan-theme (if (and (>= (string-to-number (format-time-string "%H")) 6)
			                     (>= (string-to-number (format-time-string "%H")) 18))
			                'modus-vivendi
                    'modus-operandi))
(load-theme +evan-theme t nil)
(enable-theme +evan-theme)

(when window-system
  (set-frame-position (selected-frame) 10 10)
  (add-to-list 'default-frame-alist '(height . 45))
  (add-to-list 'default-frame-alist '(width . 180)))


;; beacon
(require 'beacon)
(beacon-mode 1)

;; posframe
(require 'posframe)

;; line number
(setq display-line-numbers-width-start t)
(add-hook 'prog-mode-hook #'display-line-numbers-mode)


;; The following code means that the first time you press Alt + o, 
;; Emacs goes to the load-path directory and finds the ace-window.el file, 
;; loads the plugin and executes the ace-window function.
(lazy-load-global-keys
  '(("M-o" . ace-window))
  "ace-window")
(with-eval-after-load 'ace-window
    (setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l)))

(lazy-load-global-keys
  '(("C-;" . avy-goto-char)
    ("C-'" . avy-goto-char-2)
    ("M-g w" . avy-goto-word-0)
    ("M-g l" . avy-goto-line))
  "avy")


(add-hook 'prog-mode-hook (lambda() 
  (require 'highlight-indent-guides)
  (setq highlight-indent-guides-method 'column)
  (highlight-indent-guides-mode)

  (require 'rainbow-delimiters)
  (rainbow-delimiters-mode)
  ))

(add-hook 'emacs-lisp-mode-hook (lambda() 
  (require 'highlight-defined)
  (highlight-defined-mode)))

(provide 'init-ui)
