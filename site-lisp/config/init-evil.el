;; Enable Evil
(require 'evil)
(setq evil-magic 'very-magic)
(setq evil-search-module 'evil-search)
(setq evil-ex-search-vim-style-regexp t)
(setq evil-want-keybinding nil)
(evil-mode 1)


(provide 'init-evil)