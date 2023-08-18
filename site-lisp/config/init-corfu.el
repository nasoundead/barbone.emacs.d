
(require 'corfu)
(setq-default corfu-auto t)
(setq-default corfu-cycle t)
(setq-default corfu-quit-at-boundary t)
(setq-default corfu-quit-no-match 'separator)
(setq-default corfu-preview-current t)
(setq-default corfu-auto-prefix 1)
(setq-default corfu-auto-delay 0.01)
(setq-default completion-ignore-case t)
(setq-default read-file-name-completion-ignore-case t)
(setq-default read-buffer-completion-ignore-case t)
(setq-default corfu-doc-auto nil)

(with-eval-after-load 'eshell
    (add-hook 'eshell-mode-hook (lambda () (setq-local corfu-auto nil))))

(add-hook 'after-init-hook 'global-corfu-mode)
;; hooks
(add-hook 'corfu-mode-hook (lambda ()
                (electric-pair-mode t)
                (electric-quote-mode t)
                ))
(with-eval-after-load 'corfu
    ;; kind-icon
    (require 'kind-icon)
    ;; corfu-doc
    (require 'corfu-doc)

    (lazy-load-set-keys 
        '(("C-d" . corfu-doc-toggle)
            ("C-S-p" . corfu-doc-scroll-down)
            ("C-S-n" . corfu-doc-scroll-up)
            ("ESC" . corfu-quit)
            ([tab] . corfu-next)
            ("C-n" . corfu-next)
            ("C-p" . corfu-previous)
            ([backtab] . corfu-previous)
            )
    corfu-map)
    

)

;; kind-icon
(with-eval-after-load 'kind-icon (progn
    (setq kind-icon-default-face 'corfu-default)
    (setq kind-icon-use-icons t)
    (add-to-list 'kind-icon-mapping '(EnumMember "em" :icon "format-list-checks" :face font-lock-builtin-face))
    (add-to-list 'corfu-margin-formatters #'kind-icon-margin-formatter)))


(provide 'init-corfu)