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

(lazy-load-global-keys
    '(
        ("C-x f" . fanyi-dwim2) 
    )
    "fanyi")

;;;###autoload
(one-key-create-menu "MAGIT"
    '(
        (("s" . "Magit status") . magit-status)
        (("c" . "Magit checkout") . magit-checkout)
        (("C" . "Magit commit") . magit-commit)
        (("u" . "Magit push to remote") . magit-push-current-to-pushremote)
        (("p" . "Magit delete remote branch") . magit-delete-remote-branch)
        (("i" . "Magit pull") . magit-pull-from-upstream)
        (("r" . "Magit rebase") . magit-rebase)
        (("e" . "Magit merge") . magit-merge)
        (("l" . "Magit log") . magit-log-all)
        (("L" . "Magit blame") . magit-blame+)
        (("b" . "Magit branch") . magit-branch)
        (("B" . "Magit buffer") . magit-process-buffer)
        (("D" . "Magit discarded") . magit-discard)
        (("," . "Magit init") . magit-init)
        (("." . "Magit add remote") . magit-remote-add)
        )
    t)
;;;###autoload
(defmacro lazy-one-key-create-menu (title &rest keybinds)
  (let (one-key-key-alist)
    (dolist (ele keybinds)
      (autoload (plist-get ele :command) (plist-get ele :filename) nil t)
      (push
       (cons (cons (plist-get ele :key) (plist-get ele :description)) (plist-get ele :command))
       one-key-key-alist))
    `(one-key-create-menu ,title (quote ,one-key-key-alist))))

;;;###autoload
(lazy-one-key-create-menu "Toggle"
    (:key "l" :description "Toggle line numbers" :command display-line-numbers-mode :filename "display-line-numbers")
    (:key "s" :description "Toggle eshell" :command eshell :filename "eshell")
    (:key "f" :description "Toggle dirvish side" :command +dirvish-side-current-path :filename "init-dirvish"))

;;;###autoload
(lazy-one-key-create-menu "File"
    (:key "s" :description "Save buffer" :command save-buffer :filename "")
    (:key "d" :description "Drivish" :command dirvish :filename "init-dirvish")
    (:key "p" :description "Find emacs config" :command +find-emacs-config :filename "init-func")
    (:key "r" :description "Find recent file" :command recentf :filename "")
    (:key "f" :description "Find file" :command find-file :filename "")
    ;; (:key "F" :description "Find file with fuzzy" :command consult-fzf :filename "init-minibuffer-completion")
    )

;;;###autoload
(lazy-one-key-create-menu "Buffer"
    (:key "b" :description "Switch buffers" :command consult-buffer :filename "init-minibuffer-completion")
    (:key "k" :description "Kill buffer" :command kill-buffer-and-window :filename "")
    (:key "r" :description "Revert buffer" :command revert-buffer :filename ""))

;;;###autoload
(lazy-one-key-create-menu "Nagivator"
    (:key "d" :description "Go to definetion" :command xref-find-definitions :filename "")
    (:key "r" :description "Go to references" :command xref-find-references :filename "")
    )

;;;###autoload
(lazy-one-key-create-menu "Useful"
    (:key "u" :description "Translate region" :command gts-do-translate :filename "init-translate")
    (:key "g" :description "Go translate" :command gts-do-translate :filename "init-translate")
    (:key "e" :description "English helper" :command lsp-bridge-toggle-english-helper :filename "init-lsp-bridge")
    (:key "p" :description "Yank buffer filename" :command +yank-buffer-file-name :filename "init-func")
    (:key "S" :description "Sudo edit" :command sudo-edit :filename "sudo-edit")
    
    )

;;;###autoload
(lazy-one-key-create-menu "EAF"
    (:key "o" :description "EAF Open anything" :command eaf-open  :filename "init-eaf")
    (:key "b" :description "EAF Open browser" :command eaf-open-browser  :filename "init-eaf")
    (:key "h" :description "EAF Open browser with history" :command eaf-open-browser-with-history  :filename "init-eaf")
    (:key "s" :description "EAF Search" :command eaf-search-it  :filename "init-eaf")
    )

(provide 'init-key)