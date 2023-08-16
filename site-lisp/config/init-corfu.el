
(require 'corfu)
(setq-default corfu-auto t)
(with-eval-after-load 'eshell
    (add-hook 'eshell-mode-hook (lambda () (setq-local corfu-auto nil))))
(setq-default corfu-quit-no-match 'separator)
(add-hook 'after-init-hook 'global-corfu-mode)
;; (with-eval-after-load 'corfu
;;     (corfu-popupinfo-mode))



(provide 'init-corfu)