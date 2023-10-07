(require 'meow)
(meow-global-mode 1)


(defun lazy-meow-leader-define-key (&rest keybinds)
    (let* ((meow-leader-keybinds))
        (dolist (ele  keybinds)
        (let ((func (cdar ele))
            (key (caar ele))
            (filename (cadr ele)))
        (autoload func filename nil t)
        (meow-define-keys 'leader (cons key func))))))

(defun meow-setup ()
    (setq meow-use-clipbaord  t)
    (setq meow-keypad-ctrl-meta-prefix nil)
    (setq meow-keypad-start-keys '((?c . ?c)
                        (?h . ?h) (?x . ?x)))
    (setq meow-cheatsheet-layout meow-cheatsheet-layout-qwerty)
    
        
    (meow-leader-define-key
        ;; SPC j/k will run the original command in MOTION state.
        '("`" . +popup-scratch)
        '("t" . one-key-menu-toggle)
        '("f" . one-key-menu-file)
        '("s" . one-key-menu-search)
        '("b" . one-key-menu-buffer)
        '("u" . one-key-menu-useful)
        
        '("j" . one-key-menu-code-lsp)
        '("g" . one-key-menu-nagivator)
        '("v" . one-key-menu-magit)
        '("o" . one-key-menu-org)
        ;; Use SPC (0-9) for digit arguments.
        '("1" . meow-digit-argument)
        '("2" . meow-digit-argument)
        '("3" . meow-digit-argument)
        '("4" . meow-digit-argument)
        '("5" . meow-digit-argument)
        '("6" . meow-digit-argument)
        '("7" . meow-digit-argument)
        '("8" . meow-digit-argument)
        '("9" . meow-digit-argument)
        '("0" . meow-digit-argument)
        '("/" . meow-keypad-describe-key)
        '("?" . meow-cheatsheet)
        '("SPC" . meow-M-x)
    )

    (lazy-meow-leader-define-key
        '(("w" . one-key-menu-window) "init-window")
        '(("p" . one-key-menu-project)  "init-project")
        '(("e" . one-key-menu-eaf) "init-eaf")
        '(("n" . one-key-menu-blog) "init-org")
        '(("F" . one-key-menu-fold) "init-vimish-fold")
        '(("r" . +evan/project-recentf) "init-project")
    )
    (meow-motion-overwrite-define-key
        '("j" . meow-next)
        '("k" . meow-prev)
        '("n" . meow-next)
        '("p" . meow-prev)
        '("h" . meow-left)
        '("l" . meow-right)
        '("o" . meow-block)
        '("e" . meow-line)
        '("m" . meow-mark-word)
        '("M" . meow-mark-symbol)
        '("<escape>" . ignore))
    (meow-normal-define-key
        '("?" . meow-keypad-describe-key)
        '("*" . meow-expand-0)
        '("=" . meow-expand-9)
        '("!" . meow-expand-8)
        '("[" . meow-expand-7)
        '("]" . meow-expand-6)
        '("{" . meow-expand-5)
        '("+" . meow-expand-4)
        '("}" . meow-expand-3)
        '(")" . meow-expand-2)
        '("(" . meow-expand-1)
        '("-" . negative-argument)
        '(";" . meow-reverse)
        '("," . meow-inner-of-thing)
        '("." . meow-bounds-of-thing)
        '("<" . meow-beginning-of-thing)
        '(">" . meow-end-of-thing)
        '("a" . meow-append)
        '("A" . meow-open-below)
        '("b" . meow-back-word)
        '("B" . meow-back-symbol)
        '("c" . meow-change)
        '("d" . meow-delete)
        '("D" . meow-backward-delete)
        '("e" . meow-line)
        '("E" . meow-goto-line)

        '("f" . meow-find)
        '("g" . meow-cancel-selection)
        '("G" . meow-grab)
        '("h" . meow-left)
        '("H" . meow-left-expand)
        '("i" . meow-insert)
        '("I" . meow-open-above)
        '("j" . meow-join)
        '("k" . meow-kill)
        '("l" . meow-right)
        '("L" . meow-right-expand)
        '("m" . meow-mark-word)
        '("M" . meow-mark-symbol)
        '("n" . meow-next)
        '("N" . meow-next-expand)
        '("o" . meow-block)
        '("O" . meow-to-block)
        '("p" . meow-prev)
        '("P" . meow-prev-expand)
        '("q" . meow-quit)
        '("r" . meow-replace)
        '("R" . meow-swap-grab)
        '("s" . meow-search)
        '("t" . meow-till)
        '("u" . meow-undo)
        '("U" . meow-undo-in-selection)
        '("v" . meow-visit)
        '("w" . meow-next-word)
        '("W" . meow-next-symbol)

        '("x" . meow-save)
        '("X" . meow-sync-grab)
        '("y" . meow-yank)
        '("z" . meow-pop-selection)
        '("$" . repeat)
        '("'" . repeat)
        '("&" . meow-query-replace-regexp)
        '("%" . meow-query-replace)
        '("<escape>" . ignore)))

(meow-setup)

(provide 'init-meow)