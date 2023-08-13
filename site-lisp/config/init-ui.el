(require 'doom-themes)
(require 'beacon)

(setq +evan-theme (if (and (>= (string-to-number (format-time-string "%H")) 6)
			       (>= (string-to-number (format-time-string "%H")) 18))
			  'doom-one
		      'doom-one-light))
  (load-theme +evan-theme t nil)
  (enable-theme +evan-theme)

(beacon-mode 1)

(add-hook 'prog-mode-hook #'display-line-numbers-mode)

(provide 'init-ui)