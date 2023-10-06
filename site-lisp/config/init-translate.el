;; fanyi
(custom-set-variables
    '(fanyi-providers '(fanyi-haici-provider
                        fanyi-youdao-thesaurus-provider
                        fanyi-etymon-provider)))
(setq fanyi-sound-player-support-https t)

;; go-translate
(require 'go-translate)
(setq gts-translate-list '(("en" "zh")))
(setq gts-default-translator
    (gts-translator
    :picker (gts-prompt-picker)
    :engines (list (gts-google-engine))
    :render (gts-buffer-render)))

(provide 'init-translate)