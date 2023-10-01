
(add-hook 'prog-mode-hook
	  (lambda ()
            (require 'flycheck)
            (require 'lsp-mode)

            ))

(require 'add-hooks)
(add-hooks '((
                (python-mode python-ts-mode)
                .
                (lambda()
                    (require 'lsp-pyright)
                    (lsp))
                )
            )
)
(add-hooks '(((
                js-ts-mode
                css-ts-mode
                markdown-mode
                yaml-mode
                yaml-ts-mode
                typescript-ts-mode
                tsx-ts-mode
                ) . lsp)))

(with-eval-after-load 'lsp-mode
    (define-key lsp-mode-map [remap xref-find-definitions] 'lsp-find-definition)
    (define-key lsp-mode-map (kbd "M-?") 'xref-find-references)
    (define-key lsp-mode-map [remap xref-find-references] 'lsp-find-references)
)


(setq lsp-keymap-prefix ""
    lsp-headerline-breadcrumb-segments '(symbols))
;; feature enable
(setq lsp-enable-links nil
    lsp-enable-indentation nil
    lsp-enable-on-type-formatting nil
    lsp-enable-relative-indentation nil
    lsp-headerline-breadcrumb-enable nil
    lsp-inlay-hint-enable t
    lsp-log-io nil
    lsp-lens-enable nil)
;; lsp fancy features
(setq
    ;; ui
    lsp-progress-via-spinner nil
    ;; completion
    lsp-completion-enable t
    lsp-completion-show-detail t
    lsp-completion-show-kind t
    lsp-completion-use-last-result t
    ;; headerline
    lsp-headerline-breadcrumb-enable-symbol-numbers t
    ;; signature
    lsp-signature-doc-lines 10)
;; lsp server config
(setq tab-always-indent 'complete)
(setq lsp-response-timeout 1)
;; (setq lsp-prefer-capf :none)
(setq lsp-completion-provider :none)

(add-hook 'lsp-mode-hook
    (lambda ()
        (flycheck-mode)
        (require 'lsp-completion)
        (setq-local completion-at-point-functions (list (lsp-completion-at-point)))
        (require 'lsp-modeline)
        (require 'lsp-ui)
        ))

;;;###autoload
(defun +lsp-mode-setup-completion ()
    (setf (alist-get 'styles (alist-get 'lsp-capf completion-category-defaults))
        '(orderless)))

(add-hook 'lsp-completion-mode-hook
    #'+lsp-mode-setup-completion)

;;;###autoload
(defun +orderless-dispatch-flex-first (_pattern index _total)
    (and (eq index 0) 'orderless-flex))
(add-hook 'orderless-style-dispatchers
    #'+orderless-dispatch-flex-first nil 'local)


(provide 'init-lsp)
