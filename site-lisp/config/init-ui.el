;; themes
(require 'doom-themes)
(setq +evan-theme (if (and (>= (string-to-number (format-time-string "%H")) 6)
			       (>= (string-to-number (format-time-string "%H")) 18))
			  'doom-one
		      'doom-one-light))
  (load-theme +evan-theme t nil)
  (enable-theme +evan-theme)

;; beacon
(require 'beacon)
(beacon-mode 1)

;; line number
(add-hook 'prog-mode-hook #'display-line-numbers-mode)


;; The following code means that the first time you press Alt + o, 
;; Emacs goes to the load-path directory and finds the ace-window.el file, 
;; loads the plugin and executes the ace-window function.
(lazy-load-global-keys
 '(("M-o" . ace-window))
 "ace-window")
(with-eval-after-load 'ace-window
    (setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l)))
;; (global-set-key (kbd "M-o") 'ace-window)


(provide 'init-ui)