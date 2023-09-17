(require 'add-hooks)

(setq initial-buffer-choice t)

(setq user-full-name "nasoundead")       ;设置用户名
(setq user-mail-address
      "nasoundead@163.com") 	;设置邮箱
(setq use-dialog-box nil)               ;never pop dialog
(setq ring-bell-function 'ignore)       ;关闭烦人的出错时的提示声
(setq mouse-yank-at-point t)            ;粘贴于光标处,而不是鼠标指针处
(setq x-select-enable-clipboard t)      ;阻止退出emacs时和外部clipmgr交互导致卡顿 x11
(setq select-enable-clipboard t)        ; wayland 复制粘贴共享
(setq split-width-threshold 180)        ;分屏的时候使用上下分屏
(setq inhibit-compacting-font-caches t) ;使用字体缓存，避免卡顿
(setq word-wrap-by-category t)          ;按照中文折行
(setq garbage-collection-messages t)	;gc时显示消息
(setq byte-compile-warnings nil)	    ;关闭字节编译警告
(setq load-prefer-newer nil)
;; (setq custom-file "~/.emacs.d/site-lisp/custom.el")
(setq ad-redefinition-action 'accept)   ;不要烦人的 redefine warning
;; 增加长行处理性能
(setq bidi-inhibit-bpa t)
(setq bidi-paragraph-direction 'left-to-right)

(defalias 'yes-or-no-p 'y-or-n-p)
(setq yes-or-no-prompt "(y or n)")

(pixel-scroll-mode t)
(pixel-scroll-precision-mode t)

(setq scroll-step 0
      scroll-conservatively 1)

;; coding
(defun windows-shell-mode-coding ()
    (set-buffer-file-coding-system 'gbk)
    (set-buffer-process-coding-system 'gbk 'gbk))
(defun python-encode-in-org-babel-execute (func body params)
    (let ((coding-system-for-write 'utf-8))
      (funcall func body params)))
(cond
 ((eq system-type 'windows-nt)
  (set-language-environment "chinese-gbk")
  (prefer-coding-system 'utf-8)
  (set-terminal-coding-system 'gbk)
  (modify-coding-system-alist 'process "*" 'gbk)
  (add-hook 'shell-mode-hook #'windows-shell-mode-coding)
  (add-hook 'inferior-python-mode-hook #'windows-shell-mode-coding)
  (advice-add #'org-babel-execute:python :around
              #'python-encode-in-org-babel-execute))
 (t
  (set-language-environment "UTF-8")
  (prefer-coding-system 'utf-8)))

;; Environment
(when (or (eq system-type 'darwin) (eq system-type 'gnu/linux))
  (use-package exec-path-from-shell
    :init
    (setq exec-path-from-shell-check-startup-files nil)
    (setq exec-path-from-shell-variables '("PATH" "MANPATH" "PYTHONPATH" "GOPATH"))
    (setq exec-path-from-shell-arguments '("-l"))
    (exec-path-from-shell-initialize)))

;; Key Modifiers
(when (eq system-type 'windows-nt)
  ;; make PC keyboard's Win key or other to type Super or Hyper, for emacs running on Windows.
  (setq w32-pass-lwindow-to-system nil)
  (setq w32-lwindow-modifier 'super) ; Left Windows key

  (setq w32-pass-rwindow-to-system nil)
  (setq w32-rwindow-modifier 'super) ; Right Windows key

  (setq w32-pass-apps-to-system nil)

  (setq w32-apps-modifier 'hyper)
  (setq w32-rwindow-modifier 'hyper)
  )

;; 关闭自动备份文件
(setq make-backup-files nil)
;; 关闭启动页
(setq inhibit-startup-screen nil)
;; 关闭dir local
(setq enable-dir-local-variables t)
(setq scroll-margin 0); 设定滚动边距
(setq-default truncate-lines t) ; 不要换行
(setq truncate-partial-width-windows nil)
(setq fill-column 180)
(setq lexical-binding t)
;; 环境变量
(setq-default recentf-max-saved-items 1000)

; START TABS CONFIG
;; Create a variable for our preferred tab width
(setq custom-tab-width 2)
;; Two callable functions for enabling/disabling tabs in Emacs
(defun disable-tabs () 
  (setq indent-tabs-mode nil))
(defun enable-tabs  ()
  (local-set-key (kbd "TAB") 'tab-to-tab-stop)
  (setq indent-tabs-mode t)
  (setq tab-width custom-tab-width))
;; Hooks to Enable Tabs
(add-hook 'prog-mode-hook 'enable-tabs)
;; Hooks to Disable Tabs
(add-hook 'lisp-mode-hook 'disable-tabs)
(add-hook 'emacs-lisp-mode-hook 'disable-tabs)
;; Language-Specific Tweaks
(setq-default python-indent-offset custom-tab-width) ;; Python
(setq-default js-indent-level custom-tab-width)      ;; Javascript

;; Making electric-indent behave sanely
(setq-default electric-indent-inhibit t)

;; Make the backspace properly erase the tab instead of
;; removing 1 space at a time.
(setq backward-delete-char-untabify-method 'hungry)

;; (OPTIONAL) Shift width for evil-mode users
;; For the vim-like motions of ">>" and "<<".
;; (setq-default evil-shift-width custom-tab-width)

;; WARNING: This will change your life
;; (OPTIONAL) Visualize tabs as a pipe character - "|"
;; This will also show trailing characters as they are useful to spot.
(setq whitespace-style '(face tabs tab-mark trailing))
(custom-set-faces
 '(whitespace-tab ((t (:foreground "#636363")))))
(setq whitespace-display-mappings
  '((tab-mark 9 [124 9] [92 9]))) ; 124 is the ascii ID for '\|'
(global-whitespace-mode) ; Enable whitespace mode everywhere
; END TABS CONFIG


(setq ediff-window-setup-function 'ediff-setup-windows-plain ;; Everything in a frame
      ediff-split-window-function 'split-window-horizontally)
(add-hook 'ediff-quit-hook #'winner-undo)
(add-hook 'after-init-hook
      (lambda ()
            (recentf-mode t)
            (savehist-mode t)
            (save-place-mode t)
            (winner-mode t)   ; C-c <left> : winner-undo, C-c <right> : winner-redo
            (global-auto-revert-mode t)
            (global-so-long-mode 1)
            (delete-selection-mode 1)
            (electric-pair-mode)
            (require 'hl-todo)
            (global-hl-todo-mode t)
            ))
;; goggles
(require 'goggles)
(add-hooks '(((prog-mode text-mode) . goggles-mode)))
;; 显示空白字符，如 \t \v \v 空格等等
(add-hooks '(((prog-mode markdown-mode conf-mode) . whitespace-mode)))
(setq whitespace-style '(face trailing))


;; isearch enhancements
;; (require 'anzu)
;; (add-hook 'after-init-hook 'global-anzu-mode)
;; (setq anzu-mode-lighter "")
;; (global-set-key [remap query-replace-regexp] 'anzu-query-replace-regexp)
;; (global-set-key [remap query-replace] 'anzu-query-replace)
(setq isearch-lazy-count t)
(setq lazy-count-prefix-format "%s/%s ")
(setq lazy-highlight-cleanup nil)
;; 这样可以在literal的isearch中，把空格直接当成正则里面的.*匹
(setq isearch-lax-whitespace t)
(setq search-whitespace-regexp ".*")
;; 默认的isearch-forward函数是literal的，也就是用户输入什么就匹配什么，没有正则解释，没有转义，完全literal。这样的好处就是，想搜啥就是啥，不用考虑太多。其实默认用它就可以了。
;; 当然，完全可以开启正则匹配等功能，下面就说说这几个toggle函数。
;; isearch-toggle-regexp 在使用isearch搜索时（即按下C-s isearch-forward后）绑定到M-s r。 按下后，您的输入全部都会被以正则来匹配了。
;; isearch-toggle-case-fold 默认绑到M-s c。默认isearch对大小写是类似于rg一样“smart”的。具体地说，如果用户全部输入小写，则不匹分大小写进行匹配，如果用户输入中包括大写，则精确匹配大小写。 再举个例子，默认情况下，默认foo可以匹配foo,Foo,FOO。输入Foo，只能匹配到Foo。打开这个选项后，就是case sensitive了，也就只能精确匹配了。个人认为，该选项用处不太大。
;; isearch-toggle-word 默认绑定到M-s w。打开word匹配。直接举例：未打开以前，foo可以匹配foobar，foo。打开该选项后，foo只能匹配foo了，foobar就匹配不到了。 可以看出来，开启该选项后，isearch必须完全匹配一个完整地word。这个功能可以帮忙过滤很多杂项。
;; isearch-toggle-symbol 默认绑定到M-s _ 。它和isearch-toggle-word的基本一样，不过它使isearch完全匹配一个symbol。 简单来说，symbol和word的区别：isearch-toggle-word是一个symbol，它包括isearch toggle和word三个word。
;; isearch-toggle-lax-whitespace 默认绑定到M-s SPC。开启该功能后，可以把输入中的空格当做一个固定的正则表达式，这个固定的正则表达式存在于search-whitespace-regexp变量中。关于这个功能，我在后面 空格的特殊用法 中进行详细说明。
(with-eval-after-load 'isearch
  ;; DEL during isearch should edit the search string, not jump back to the previous result
  (define-key isearch-mode-map [remap isearch-delete-char] 'isearch-del-char)
  ;; Activate occur easily inside isearch
  (when (fboundp 'isearch-occur)
    ;; to match ivy conventions
    (define-key isearch-mode-map (kbd "C-c C-o") 'isearch-occur))

;;   (define-key isearch-mode-map (kbd "<C-return>") 'swiper-from-isearch)

  (defadvice isearch-search (after isearch-no-fail activate)
  (unless isearch-success
    (ad-disable-advice 'isearch-search 'after 'isearch-no-fail)
    (ad-activate 'isearch-search)
    (isearch-repeat (if isearch-forward 'forward))
    (ad-enable-advice 'isearch-search 'after 'isearch-no-fail)
    (ad-activate 'isearch-search)))
)


;; which-key
(require 'which-key)
(which-key-mode)

;; (lazy-load-unset-keys '("C-x C-f" "C-z" "C-q" "s-W" "s-z" "M-h" "C-x C-c" "C-\\" "s-c" "s-x" "s-v"))

;; undo
(lazy-load-global-keys
    '(("C-z" . vundo))
    "vundo")

;; better comment
(lazy-load-global-keys
    '(("M-;" . comment-dwim-2))
    "comment-dwim-2")
(with-eval-after-load 'org-mode
    (lazy-load-local-keys
        '(("M-;" . org-comment-dwim-2))
        org-mode-map
        "comment-dwim-2"))

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

;; folding
(lazy-load-global-keys
    '(
      ("C-{" . origami-recursively-toggle-node)
      ("C-M-{" . origami-toggle-all-nodes)
    )
    "origami")

;; diff-hl
(require 'diff-hl)
(setq diff-hl-draw-borders nil)
(add-hook 'prog-mode-hook 'diff-hl-mode)

;; https://editorconfig.org/
(require 'editorconfig)
(editorconfig-mode 1)

(global-set-key (kbd "C-x C-r") #'restart-emacs)

(provide 'init-better-default)
