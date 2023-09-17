(require 'web-mode)

(setq web-mode-part-padding 0
    web-mode-block-padding 0
    web-mode-script-padding 0)

(setq web-mode-css-indent-offset 2
    web-mode-code-indent-offset 2
    web-mode-markup-indent-offset 2)

(setq web-mode-enable-auto-quoting nil
    web-mode-enable-current-column-highlight nil)


(add-hook 'web-mode-hook (lambda ()
                (emmet-mode)
                ;; 当为jsx/tsx时，补全风格随之变化
                ))

(provide 'init-web)