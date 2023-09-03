;; (require 'init-func)
(lazy-load-global-keys
 '(("C-d" . +duplicate-line))
 "init-func")

(lazy-load-global-keys
  '(
    ("C-c g g" . magit)
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
