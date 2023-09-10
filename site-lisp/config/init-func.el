;;;###autoload
(defun +find-emacs-config ()
  (interactive)
  (find-file (read-file-name "📂: " (expand-file-name "~/.emacs.d/site-lisp/config/"))))

;;;###autoload
(defun +reload-load-path ()
  (interactive)
  (let ((default-directory "~/.emacs.d/site-lisp")
	(gc-cons-threshold most-positive-fixnum)
	(gc-cons-percentage 1.0))
    (normal-top-level-add-subdirs-to-load-path)))

;;;###autoload
(defun +clean-theme()
  (interactive)
  (mapc #'disable-theme custom-enabled-themes))

(defun +yank-buffer-file-name ()
  (interactive)
  (push buffer-file-name kill-ring))

;;;###autoload
(defun +toggle-transparent ()
  (interactive)
  (if (eq (frame-parameter (selected-frame) 'alpha-background) 100)
      (set-frame-parameter (selected-frame) 'alpha-background 70)
    (set-frame-parameter (selected-frame) 'alpha-background 100)))

;;;###autoload
(defun +popup-scratch ()
  (interactive)
  (let ((buf-name (concat "*scratch*-" (format-time-string "%H:%m:%S"))))
    (with-current-buffer (get-buffer-create buf-name)
      (call-interactively 'text-mode)
      (popwin:popup-buffer (current-buffer)))))

;;;###autoload
(defun +duplicate-line(comment-first)
    "Duplicate the current line."
    (interactive "P")
    (let ((line-text (buffer-substring-no-properties
                      (line-beginning-position)
                      (line-end-position))))
      (save-excursion
        (if comment-first
            (progn
              (comment-line 1)
              (move-beginning-of-line 1)
              (open-line 1))
          (move-end-of-line 1)
          (open-line 1)
          (forward-char))
        (insert line-text))
      (next-line)))

;;;###autoload
(defun +fullscreen ()
    (interactive)
    (set-frame-parameter nil 'fullscreen
      (if (frame-parameter nil 'fullscreen) nil 'fullboth)))

(provide 'init-func)
