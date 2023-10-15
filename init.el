(require 'init-project)
(require 'init-better-default)
(require 'init-key)

(require 'init-ui)
(require 'init-mode)

(when (display-graphic-p)
  (require 'init-font)
)
;; (require 'init-meow)
(require 'init-flycheck)
(require 'init-lsp)
(require 'init-treesit)
(require 'init-minibuffer)
(require 'init-corfu)

(require 'init-org)
(require 'init-web)

;; 启动1s后再开启gc管理
(run-with-idle-timer 1 0 
  (lambda ()
        (require 'init-gcmh)))

(setq custom-file (concat user-emacs-directory "custom.el"))
;; (setq custom-file (expand-file-name "./custom.el" user-emacs-directory))
;; (load custom-file t t)
