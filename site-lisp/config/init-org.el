(require 'org)
(require 'org-modern)
(require 'org-agenda)
(require 'org-capture)
(require 'valign)

(with-eval-after-load 'org
    (global-org-modern-mode))

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

;; Toggle markup visibility with visible mode
(with-eval-after-load "org"
    (define-key org-mode-map (kbd "C-c v") 'visible-mode))

(add-hook 'org-mode-hook 'variable-pitch-mode)
(with-eval-after-load "org"
;; Use fixed pitch for table and code
(custom-set-faces
    '(org-table ((t :inherit 'fixed-pitch-serif)))
    '(org-code ((t :inherit 'fixed-pitch-serif)))
    '(org-block ((t :inherit 'fixed-pitch-serif)))
    '(org-checkbox ((t :inherit 'fixed-pitch :background unspecified :box nil)))
    '(org-latex-and-related ((t (:inherit 'fixed-pitch-serif))))))

;; org-roam
(require 'org-roam)
(setq org-roam-directory (expand-file-name "~/Org"))
(defvar org-roam-keymap
    (let ((keymap (make-keymap)))
        (define-key keymap "l" 'org-roam-buffer-toggle)
        (define-key keymap "f" 'org-roam-node-find)
        (define-key keymap "g" 'org-roam-graph)
        (define-key keymap "i" 'org-roam-node-insert)
        (define-key keymap "c" 'org-roam-capture)
        (define-key keymap "s" 'org-roam-db-sync)
        keymap))
(defalias 'org-roam-keymap org-roam-keymap)
(global-set-key (kbd "C-c r") 'org-roam-keymap)
(with-eval-after-load "org-roam"
    (org-roam-setup)) 

;; toc
(if (require 'toc-org nil t)
    (progn
      (add-hook 'org-mode-hook 'toc-org-mode)

      ;; enable in markdown, too
      (add-hook 'markdown-mode-hook 'toc-org-mode)
      )
  (warn "toc-org not found"))

;; babel
(setq org-confirm-babel-evaluate nil)
(org-babel-do-load-languages
    'org-babel-load-languages
    '(
        (emacs-lisp . t)
        (js         . t)
        (plantuml   . t)
        (python . t)))

(provide 'init-org)