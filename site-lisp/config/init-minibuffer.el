(require 'vertico)
(add-hook 'after-init-hook 'vertico-mode)

(require 'marginalia)
(add-hook 'after-init-hook 'marginalia-mode)

(with-eval-after-load 'vertico
    (require 'orderless)
    (setq completion-styles '(orderless basic)))
(setq completion-category-defaults nil
    completion-category-overrides nil)
(setq completion-cycle-threshold 4)

(with-eval-after-load 'vertico
    (require 'embark)
    (define-key vertico-map (kbd "C-c C-o") 'embark-export)
    (define-key vertico-map (kbd "C-c C-c") 'embark-act))

(require 'consult)
(require 'consult-xref)
(require 'consult-org)
(require 'consult-imenu)

(defmacro +no-consult-preview (&rest cmds)
      `(with-eval-after-load 'consult
         (consult-customize ,@cmds 
          :preview-key "M-."
          ;; :preview-key '(:debounce 0.4 any) ;; Option 1: Delay preview
          )))

(+no-consult-preview
  consult-ripgrep
  consult-git-grep consult-grep
  consult-bookmark consult-recent-file consult-xref
  consult--source-recent-file consult--source-project-recent-file consult--source-bookmark)

(when (and (executable-find "rg"))
  (defun +consult-ripgrep-at-point (&optional dir initial)
    (interactive (list prefix-arg (when-let ((s (symbol-at-point)))
                                    (symbol-name s))))
    (consult-ripgrep dir initial))
  (+no-consult-preview +consult-ripgrep-at-point)
  (global-set-key (kbd "M-?") '+consult-ripgrep-at-point))

(global-set-key [remap switch-to-buffer] 'consult-buffer)
(global-set-key [remap switch-to-buffer-other-window] 'consult-buffer-other-window)
(global-set-key [remap switch-to-buffer-other-frame] 'consult-buffer-other-frame)
(global-set-key [remap goto-line] 'consult-goto-line)

(provide 'init-minibuffer)