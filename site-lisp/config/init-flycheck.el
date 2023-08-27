(with-eval-after-load 'flycheck
  ;; variable
  (setq flycheck-checker-error-threshold 200)
  (setq flycheck-idle-change-delay 0.2)
  ;; face
  (set-face-underline 'flycheck-error nil)
  (set-face-foreground 'flycheck-error "#99324B")
  (set-face-attribute 'flycheck-error nil :weight 'bold :inverse-video nil))


(provide 'init-flycheck)
