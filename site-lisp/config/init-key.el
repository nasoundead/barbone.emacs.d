(lazy-load-global-keys
    '(
        ("M-S-<down>" . +duplicate-line)
        ([f11] . +fullscreen)
        )
    "init-func")

;; (lazy-load-global-keys
;; '(
;;     ("C-x d" . dirvish)
;;     ;; ([f8] . +dirvish-side-current-path)
;;     )
;;     "init-dirvish")

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
(lazy-load-global-keys
    '(
        ("C-x l" . ialign)
    )
    "ialign")

;; move text
(lazy-load-global-keys
    '(
        ("M-<up>"   . move-text-up)
        ("M-<down>" . move-text-down)
    )
    "move-text")

;; undo
(lazy-load-global-keys
    '(("C-z" . vundo))
    "vundo")

;; expand region
(lazy-load-global-keys
    '(
        ("C-w" . er/expand-region)
        ("C-S-w" . er/contract-region)
    )
    "expand-region")

;; multi-cursor
(lazy-load-global-keys
    '(
        ("C-c C-<" . mc/mark-all-dwim)
        ("C->" . mc/mark-next-like-this)
        ("C-<" . mc/mark-previous-like-this)
    )
    "multiple-cursors")

(lazy-load-global-keys
    '(
        ("C-q" . emacs-surround)
    )
    "emacs-surround")

;; folding
(lazy-load-global-keys
    '(
        ("C-{" . origami-recursively-toggle-node)
        ("C-M-{" . origami-toggle-all-nodes)
    )
    "origami")

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
(one-key-create-menu
    "Window"
    '((("l" . "Focus right window") . windmove-right)
    (("h" . "Focus left window") . windmove-left)
    (("k" . "Focus up window") . windmove-up)
    (("j" . "Focus down window") . windmove-down)
    (("L" . "Swap right window") . windmove-swap-states-right)
    (("H" . "Swap left window") . windmove-swap-states-left)
    (("K" . "Swap up window") . windmove-swap-states-up)
    (("J" . "Swap down window") . windmove-swap-states-down)
    (("s" . "Split window vertically") . split-window-below)
    (("v" . "Split window horizontally") . split-window-right)
    (("d" . "Delete window") . delete-window)
    (("u" . "Undo window") . winner-undo)
    (("C-h" . "Resize window to smaller") . shrink-window-horizontally)
    (("m" . "Delete other window") . delete-other-windows)
    (("C-k" . "Scroll other window up") . scroll-other-window-down)
    (("C-j" . "Scroll other window down") . scroll-other-window)
    (("r" . "Rotate window") . rotate-window)
    (("R" . "Rotate layout") . rotate-layout)
    ))

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