(require 'init-project)
(require 'init-better-default)
(require 'init-key)

(require 'init-ui)
(require 'init-mode)

(when (display-graphic-p)
  (require 'init-font)
)

;; (require 'init-evil)
(require 'init-meow)
(require 'init-flycheck)
(require 'init-lsp)
(require 'init-treesit)
(require 'init-minibuffer)
(require 'init-corfu)

(require 'init-web)

;; 启动1s后再开启gc管理
(run-with-idle-timer 1 0 
  (lambda ()
        (require 'init-gcmh)))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("9e346b1a1551c2dbe139eb4b8db593ed4070b23d5a0e08e4d0a0b2dce835a909" default))
 '(fanyi-providers
   '(fanyi-haici-provider fanyi-youdao-thesaurus-provider fanyi-etymon-provider)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-table ((t (:family "Ubuntu Mono"))))
 '(whitespace-tab ((t (:foreground "#636363")))))
