(require 'dirvish)
(require 'dirvish-side)
(dirvish-override-dired-mode)
(dirvish-side-follow-mode)

(setq dirvish-attributes
      '(vc-state file-size git-msg subtree-state all-the-icons collapse file-time))
(setq dirvish-mode-line-format '(:left (sort symlink) :right (vc-info yank index)))
(setq dirvish-header-line-height '(25 . 35))
(setq dirvish-side-width 38)
(setq dirvish-header-line-format '(:left (path) :right (free-space)))
(setq dired-listing-switches
      "-l --almost-all --human-readable --group-directories-first --no-group")
(setq dired-dwim-target t)
(setq dired-auto-revert-buffer t)

(dolist (hook '(dired-mode-hook dirvish-mode-hook))
    (add-hook hook (lambda ()

        (keymap-set dired-mode-map "C-b" 'dired-up-directory)
        (keymap-set dired-mode-map "C-f" 'dired-find-file)
        )))

(lazy-load-set-keys
    '(
        ;; left click for expand/collapse dir or open file
        ("<mouse-1>" . dirvish-subtree-toggle-or-open)
        ;; middle click for opening file / entering dir in other window
        ("<mouse-2>" . dired-mouse-find-file-other-window)
        ;; right click for opening file / entering dir
        ("<mouse-3>" . dired-mouse-find-file)
        ([remap dired-sort-toggle-or-edit] . dirvish-quicksort)
        ([remap dired-do-redisplay] . dirvish-ls-switches-menu)
        ([remap dired-do-copy] . dirvish-yank-menu)
        ("?"   . dirvish-dispatch)
        ("q"   . dirvish-quit)
        ("a"   . dirvish-quick-access)
        ("f"   . dirvish-file-info-menu)
        ("x"   . dired-do-delete)
        ("X"   . dired-do-flagged-delete)
        ("y"   . dirvish-yank-menu)
        ("s"   . dirvish-quicksort)
        ("TAB" . dirvish-subtree-toggle)
        ("M-t" . dirvish-layout-toggle)
        ("M-b" . dirvish-history-go-backward)
        ("M-f" . dirvish-history-go-forward)
        ("M-n" . dirvish-narrow)
        ("M-m" . dirvish-mark-menu)
        ("M-s" . dirvish-setup-menu)
        ("M-e" . dirvish-emerge-menu)
        )
    dirvish-mode-map)


;; (bind-keys
;;     :map 'dirvish-mode-map
;;     ;; left click for expand/collapse dir or open file
;;     ("<mouse-1>" . dirvish-subtree-toggle-or-open)
;;     ;; middle click for opening file / entering dir in other window
;;     ("<mouse-2>" . dired-mouse-find-file-other-window)
;;     ;; right click for opening file / entering dir
;;     ("<mouse-3>" . dired-mouse-find-file)
;;     ([remap dired-sort-toggle-or-edit] . dirvish-quicksort)
;;     ([remap dired-do-redisplay] . dirvish-ls-switches-menu)
;;     ([remap dired-do-copy] . dirvish-yank-menu)
;;     ("?"   . dirvish-dispatch)
;;     ("q"   . dirvish-quit)
;;     ("a"   . dirvish-quick-access)
;;     ("f"   . dirvish-file-info-menu)
;;     ("x"   . dired-do-delete)
;;     ("X"   . dired-do-flagged-delete)
;;     ("y"   . dirvish-yank-menu)
;;     ("s"   . dirvish-quicksort)
;;     ("TAB" . dirvish-subtree-toggle)
;;     ("M-t" . dirvish-layout-toggle)
;;     ("M-b" . dirvish-history-go-backward)
;;     ("M-f" . dirvish-history-go-forward)
;;     ("M-n" . dirvish-narrow)
;;     ("M-m" . dirvish-mark-menu)
;;     ("M-s" . dirvish-setup-menu)
;;     ("M-e" . dirvish-emerge-menu))

;;;###autoload
(defun +dirvish-side-current-path ()
  (interactive)
  (dirvish-side ))

(add-hook 'dirvish-side-follow-mode-hook (lambda () (display-line-numbers-mode -1)))


(provide 'init-dirvish)
