;;;###autoload
(defun +evan/find-emacs-config ()
  (interactive)
  (find-file (read-file-name "📂: " (expand-file-name "~/.emacs.d/site-lisp/config/"))))


;;;###autoload
(defun +evan/reload-load-path ()
  (interactive)
  (let ((default-directory "~/.emacs.d/site-lisp")
	(gc-cons-threshold most-positive-fixnum)
	(gc-cons-percentage 1.0))
    (normal-top-level-add-subdirs-to-load-path)))

(defun +evan/find-emacs-config-2()
  (interactive)
  (read-file-name "init file" (expand-file-name "~/.emacs.d/site-lisp/config")))

;;;###autoload
(defun +clean-theme()
  (interactive)
  (mapc #'disable-theme custom-enabled-themes))


;;;###autoload
(defun +evan/toggle-proxy ()
  (interactive)
  (if (null url-proxy-services)
      (progn
        (setq url-proxy-services
              '(("http" . "192.168.1.128:1085")
                ("https" . "192.168.1.128:1085")))
        (message "代理已开启."))
    (setq url-proxy-services nil)
    (message "代理已关闭.")))

(defun +evan/yank-buffer-file-name ()
  (interactive)
  (push buffer-file-name kill-ring))

;;;###autoload
(defun +evan/toggle-transparent ()
  (interactive)
  (if (eq (frame-parameter (selected-frame) 'alpha-background) 100)
      (set-frame-parameter (selected-frame) 'alpha-background 70)
    (set-frame-parameter (selected-frame) 'alpha-background 100)))

;;;###autoload
(defun +evan/popup-scratch ()
  (interactive)
  (let ((buf-name (concat "*scratch*-" (format-time-string "%H:%m:%S"))))
    (with-current-buffer (get-buffer-create buf-name)
      (call-interactively 'text-mode)
      (popwin:popup-buffer (current-buffer)))))


(provide 'init-func)
