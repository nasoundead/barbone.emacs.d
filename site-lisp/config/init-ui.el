;; themes
;; (require 'doom-themes)
;; (setq +evan-theme 'doom-moonlight)
(setq +evan-theme (if (and (>= (string-to-number (format-time-string "%H")) 6)
			                     (>= (string-to-number (format-time-string "%H")) 18))
			                'modus-vivendi
                    'modus-operandi))
(load-theme +evan-theme t nil)
(enable-theme +evan-theme)

(when window-system
  (set-frame-position (selected-frame) 10 10)
  (add-to-list 'default-frame-alist '(height . 45))
  (add-to-list 'default-frame-alist '(width . 160)))


;; beacon
(require 'beacon)
(beacon-mode 1)

;; modeline
(require 'doom-modeline)
(doom-modeline-mode 1)

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
  '(("C-;" . avy-goto-char))
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

;; ;; dashboard
;; (require 'dashboard)
;; (dashboard-setup-startup-hook)
;; (setq initial-buffer-choice (lambda () (get-buffer-create "*dashboard*")))
;; ;; Set the title
;; (setq dashboard-banner-logo-title "Welcome to WangHaibo's Emacs Dashboard")

;; ;; Content is not centered by default. To center, set
;; (setq dashboard-center-content t)

;; (require 'all-the-icons)
;; (setq dashboard-items '((recents  . 7)
;;                         (bookmarks . 7)
;;                         (projects . 9)
;;                         (agenda . 5)
;;                         (registers . 5)))
;; (setq dashboard-icon-type 'all-the-icons)
;; (setq dashboard-set-navigator t)
;; ;; Format: "(icon title help action face prefix suffix)"
;; (setq dashboard-navigator-buttons
;;       `(;; line1
;;         ((,(all-the-icons-octicon "mark-github" :height 1.1 :v-adjust 0.0)
;;          "Github Homepage"
;;          "Browse Github Homepage"
;;          (lambda (&rest _) (browse-url "https://www.github.com/")))
;;         ("★" "Star" "Show stars" (lambda (&rest _) (show-stars)) warning)
;;         ("?" "" "?/h" #'show-help nil "<" ">"))))
;; (setq dashboard-set-init-info t)
;; (setq dashboard-projects-switch-function 'counsel-projectile-switch-project-by-name)

;; (add-to-list 'dashboard-items '(agenda) t)
;; (setq dashboard-week-agenda t)
;; (setq dashboard-filter-agenda-entry 'dashboard-no-filter-agenda)

(provide 'init-ui)
