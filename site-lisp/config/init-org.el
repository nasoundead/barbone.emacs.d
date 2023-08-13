(require 'org)
(require 'org-agenda)
(require 'org-capture)
(require 'valign)


(add-hook 'org-mode-hook #'valign-mode)
(add-hook 'org-mode-hook 
    (lambda () (progn
        (setq org-agenda-files '("~/Org"))
        (setq org-capture-templates nil)
        (push '("i" "闪念" entry (file+headline "~/Org/idea.org" "闪念")  "* %U - %^{标题} %^g\n  %?\n") org-capture-templates)
        (push '("k" "百科" entry (file+headline "~/Org/wiki.org" "WIKI") "* %^{标题} %t %^g\n  %?\n") org-capture-templates)
        (push '("t" "任务" entry (file+headline "~/Org/todo.org" "任务")  "* TODO %^{标题} %t %^g\n  %?\n") org-capture-templates)

        (setq org-todo-keywords '((sequence "TODO(t)" "WAIT(w)" "|" "DONE(d)" "KILL(k)")))
        (let ((faces '(("TODO" . (:foreground "#fbf7f0" :background "#006800"))
	       ("WAIT" . (:foreground "#fbf7f0" :background "#f5d0a0"))
	       ("DONE" . (:foreground "black" :background "gray90"))
	       ("KILL" . (:foreground "#fbf7f0" :background "#a60000")))))
        (setq org-todo-keyword-faces faces))
    )))

;; (with-eval-after-load 'org-modern-mode (progn
;;     (modus-themes-load-operandi)
;;     )
;; )



(provide 'init-org)