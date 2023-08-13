(require 'treesit-auto)
(require 'combobulate)
(require 'add-hooks)

(setq treesit-auto-install 'prompt)
(setq treesit-font-lock-level 4)
(global-treesit-auto-mode)


(setq combobulate-key-prefix "C-c o")
(add-hooks '(((python-ts-mode js-ts-mode css-ts-mode yaml-ts-mode typescript-ts-mode tsx-ts-mode) . combobulate-mode)))



(provide 'init-treesit)