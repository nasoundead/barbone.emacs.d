(require 'init-func)

(require 'init-font)
(require 'init-ui)
(require 'init-mode)
(require 'init-treesit)
(require 'init-minibuffer)
(require 'init-corfu)





;; 启动1s后再开启gc管理
(run-with-idle-timer 1 0 (lambda ()
			   (require 'init-gcmh)))
