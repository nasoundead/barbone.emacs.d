(autoload 'markdown-mode "markdown-mode"
    "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist
            '("\\.\\(?:md\\|markdown\\|mkd\\|mdown\\|mkdn\\|mdwn\\)\\'" . markdown-mode))
(autoload 'gfm-mode "markdown-mode"
    "Major mode for editing GitHub Flavored Markdown files" t)
(add-to-list 'auto-mode-alist '("README\\.md\\'" . gfm-mode))
(with-eval-after-load 'markdown-mode
    (define-key markdown-mode-map (kbd "C-c C-e") #'markdown-do))

(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))

;; You can remap major modes with `major-mode-remap-alist'. Note
;; that this does *not* extend to hooks! Make sure you migrate them
;; also
(dolist (mapping '((python-mode . python-ts-mode)
                    (css-mode . css-ts-mode)
                    (typescript-mode . tsx-ts-mode)
                    (js-mode . js-ts-mode)
                    (css-mode . css-ts-mode)
                    (yaml-mode . yaml-ts-mode)))
    (add-to-list 'major-mode-remap-alist mapping))

;; major-mode触发配置加载
(autoload 'org-mode "init-org")


(provide 'init-mode)