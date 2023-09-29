(require 'init-project)
(require 'init-better-default)
(lazy-load-global-keys
  '(
    ("M-S-<down>" . +duplicate-line)
    ([f11] . +fullscreen)
    )
  "init-func")

(lazy-load-global-keys
  '(
    ("C-x d" . dirvish)
    ;; ([f8] . +dirvish-side-current-path)
    )
  "init-dirvish")

(lazy-load-global-keys
  '(
    ("C-c d" . ztree-diff)
    )
  "init-ztree")

(lazy-load-global-keys
  '(
    ("C-c s" . one-key-menu-yasnippet)
    )
  "init-yasnippet")

(lazy-load-global-keys
  '(
    ("C-c g" . one-key-menu-magit)
  )
  "init-magit")

(require 'init-ui)
(require 'init-mode)

(when (display-graphic-p)
  (require 'init-font)
)

;; (require 'init-evil)
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
