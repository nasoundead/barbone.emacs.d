(setq borg-rewrite-urls-alist
      '(("git@github.com:" . "https://github.com/")))
(setq package-enable-at-startup nil)

(require 'borg)
(setq borg-user-emacs-directory user-emacs-directory)
(borg-initialize)

;; epkg
(autoload 'epkg-describe-package "epkg" nil t)
(autoload 'epkg-find-file "epkg" nil t)
(autoload 'epkg-list-packages "epkg" nil t)
(autoload 'epkg-update "epkg" nil t)

(provide 'init-pkgm)
