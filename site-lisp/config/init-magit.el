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

;;;###autoload
(one-key-create-menu "MAGIT"
    '(
        (("s" . "Magit status") . magit-status)
        (("c" . "Magit checkout") . magit-checkout)
        (("C" . "Magit commit") . magit-commit)
        (("u" . "Magit push to remote") . magit-push-current-to-pushremote)
        (("p" . "Magit delete remote branch") . magit-delete-remote-branch)
        (("i" . "Magit pull") . magit-pull-from-upstream)
        (("r" . "Magit rebase") . magit-rebase)
        (("e" . "Magit merge") . magit-merge)
        (("l" . "Magit log") . magit-log-all)
        (("L" . "Magit blame") . magit-blame+)
        (("b" . "Magit branch") . magit-branch)
        (("B" . "Magit buffer") . magit-process-buffer)
        (("D" . "Magit discarded") . magit-discard)
        (("," . "Magit init") . magit-init)
        (("." . "Magit add remote") . magit-remote-add)
        )
    t)
    
(provide 'init-magit)