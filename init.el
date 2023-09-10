(require 'init-project)
(require 'init-better-default)
(lazy-load-global-keys
  '(
    ("C-d" . +duplicate-line)
    ([f11] . +fullscreen)
    )
  "init-func")

(lazy-load-global-keys
  '(
    ("C-x d" . dirvish)
    ;; ("C-c f" . dirvish-fd)
    ([f8] . +dirvish-side-current-path)
    )
  "init-dirvish")

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

(require 'init-flycheck)
(require 'init-lsp)
(require 'init-treesit)
(require 'init-minibuffer)
(require 'init-corfu)



;; 启动1s后再开启gc管理
(run-with-idle-timer 1 0 
  (lambda ()
        (require 'init-gcmh)))
