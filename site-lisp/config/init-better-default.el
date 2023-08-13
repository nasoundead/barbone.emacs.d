(require 'add-hooks)

(setq initial-buffer-choice t)
;; (add-hook 'emacs-startup-hook (lambda () (run-with-timer 0 0 (lambda () (call-interactively 'writeroom-mode)))))
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


(add-hook 'prog-mode-hook
	  (lambda ()
	      ;; (yas-minor-mode t)
            ))
(add-hook 'ediff-quit-hook #'winner-undo)
(add-hook 'after-init-hook 
      (lambda ()
            (recentf-mode t)
            (savehist-mode t)
            (save-place-mode t)
            (winner-mode t)   ; C-c <left> : winner-undo, C-c <right> : winner-redo 
            (global-auto-revert-mode t)
            (global-so-long-mode 1)
            (require 'hl-todo)
            (global-hl-todo-mode t)
            ))
;; goggles
(require 'goggles)
(add-hooks '(((prog-mode text-mode) . goggles-mode)))
;; 显示空白字符，如 \t \v \v 空格等等
(add-hooks '(((prog-mode markdown-mode conf-mode) . whitespace-mode)))
(setq whitespace-style '(face trailing))


(provide 'init-better-default)
