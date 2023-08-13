(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(setq frame-inhibit-implied-resize t)
;; 增加IO性能
(setq read-process-output-max (* 1024 1024 10))
(setq gc-cons-threshold most-positive-fixnum)
(find-function-setup-keys)

(let ((default-directory "~/.emacs.d/site-lisp")
      (file-name-handler-alist nil))

  (normal-top-level-add-subdirs-to-load-path)
  (require 'init-pkgm)
  (require 'init-better-default)
  (require 'lazy-load)
  (require 'one-key)
  
)
