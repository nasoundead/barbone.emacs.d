(require 'ztree)

;; By default all files starting with dot (like .gitignore) are not shown 
;; and excluded from the difference status for directories. 
;; One can add an additional regexps to the list ztree-diff-filter-list.

;; One also could turn on unicode characters to draw the tree with instead of normal ASCII-characters. 
;; This is controlled by the ztree-draw-unicode-lines variable.

;; The variable ztree-diff-consider-file-permissions (which is nil by default) 
;; if set to t allows to compare file attributes as well, the files will be considered different if they have different mode.

;; The special variable ztree-diff-additional-options introduced to provide an additional arguments to the 'diff' tool. 
;; For example one could specify

;; (setq ztree-diff-additional-options '("-w" "-i"))
;; to ignore case differences and whitespace differences.


;; Hotkeys supported
;; Open/close directories with double-click, RET or Space keys.
;; To jump to the parent directory, hit the Backspace key.
;; To toggle open/closed state of the subtree of the current directory, hit the x key.
;; RET on different files starts the Ediff (or open file if one absent or the same)
;; Space show the simple diff window for the current file instead of Ediff (or view file if one absent or the same)
;; TAB to fast switch between panels
;; h key to toggle show/hide identical files/directories
;; H key to toggle show/hide hidden/ignored files/directories
;; C key to copy current file or directory to the left or right panel
;; D key to delete current file or directory
;; v key to quick view the current file
;; r initiates the rescan/refresh of current file or subdirectory
;; F5 forces the full rescan.


(provide 'init-ztree)