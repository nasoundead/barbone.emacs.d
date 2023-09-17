;; yasnippet
(require 'yasnippet)
(setq yas-snippet-dirs
    '("~/.emacs.d/snippets"                 ;; personal snippets
        "~/.emacs.d/site-lisp/pkg/yasnippet-snippets/snippets"           
    ))
(yas-global-mode 1)

(one-key-create-menu
 "YASNIPPET"
 '(
   (("i" . "snippet insert") . yas-insert-snippet)
   (("c" . "snippet create") . yas-new-snippet)
   )
 t)

(provide 'init-yasnippet)