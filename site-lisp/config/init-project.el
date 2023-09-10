;; (require 'projectile)
;; (projectile-mode +1)
;; (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

(require 'project)

(define-key project-prefix-map (kbd "b") #'+evan/project-blink-search)
(define-key project-prefix-map (kbd "m") #'+evan/project-magit)
(define-key project-prefix-map (kbd "d") #'+evan/project-dired)
(define-key project-prefix-map (kbd "f") #'project-find-file)
(define-key project-prefix-map (kbd "F") #'project-find-dir)
(define-key project-prefix-map (kbd "g") #'+evan/project-rg)
(define-key project-prefix-map (kbd "t") #'multi-vterm-project)

(setq project-switch-commands nil)
(add-to-list 'project-switch-commands '(+evan/project-blink-search "BlinkSearch") t)
(add-to-list 'project-switch-commands '(+evan/project-magit "Magit") t)
(add-to-list 'project-switch-commands '(+evan/project-dired "Dired") t)
(add-to-list 'project-switch-commands '(project-find-file "Find file") t)
(add-to-list 'project-switch-commands '(project-find-dir "Find dir") t)
(add-to-list 'project-switch-commands '(+evan/project-rg "Ripgrep") t)
(add-to-list 'project-switch-commands '(multi-vterm-project "Vterm") t)



;;;###autoload
(defun +evan/project-rg ()
  (interactive)
  (let ((default-directory (project-root (project-current nil))))
    (consult-ripgrep default-directory)))

;;;###autoload
(defun +evan/project-magit ()
  (interactive)
  (require 'magit)
  (magit-status (project-root (project-current nil))))

;;;###autoload
(defun +evan/project-dired ()
  (interactive)
  (let ((default-directory (project-root (project-current nil))))
    (dired default-directory)))

;;;###autoload
(defun +evan/project-blink-search ()
  (interactive)
  (let ((default-directory (project-root (project-current nil))))
    (require 'blink-search)
    (setq blink-search-enable-posframe t)
    (setq blink-search-posframe-width-ratio 0.85)
    (setq blink-search-posframe-height-ratio 0.85)
    (blink-search)))


;;;###autoload
(defun +evan/project-recentf ()
  (interactive)
  (find-file (completing-read "Recentf in project"
		       (-filter (lambda (it)
				  (s-contains? (car (-take-last 1 (project-current))) it)) recentf-list)
		       )))


(provide 'init-project)
