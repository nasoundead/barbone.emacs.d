(require 'with-editor)
(require 'magit)
(require 'magit-section)
(require 'transient)
(setq magit-diff-refine-hunk t)
(setq magit-log-margin-show-committer-date t)
(setq magit-display-buffer-function #'magit-display-buffer-same-window-except-diff-v1)


(define-key magit-mode-map (kbd "C-S-k") #'magit-discard)
(magit-add-section-hook 'magit-status-sections-hook
			;; 'magit-insert-modules
			'magit-insert-stashes
			'append)

(defun my-magit-show-commit-advice (_)
    (cl-destructuring-bind (rev &optional args files module) _
      (list rev (cons "--diff-merges=on" args) files module)))
(advice-add 'magit-show-commit :filter-args 'my-magit-show-commit-advice)


(with-eval-after-load 'diff-hl
    (add-hook 'magit-pre-refresh-hook 'diff-hl-magit-pre-refresh)
    (add-hook 'magit-post-refresh-hook 'diff-hl-magit-post-refresh))

(provide 'init-magit)