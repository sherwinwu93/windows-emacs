(use-package evil)
(use-package evil-leader)
(use-package window-numbering)
(use-package evil-surround)
(use-package evil-nerd-commenter)
(use-package which-key)
;; evil leaderKey
(evil-leader/set-key
  ":" 'counset-M-x
  ;; file
  "d" 'dired
  "ff" 'find-file
  "fr" 'recentf-open-files
  "fs" 'save-buffer
  ;; buffer
  "bb" 'switch-to-buffer
  "bl" 'list-buffers
  "bk" 'kill-buffer
  ;; window
  ;; 需要设置window-numbering生效
  "o" 'other-window
  "0" 'select-window-0
  "1" 'select-window-1
  "2" 'select-window-2
  "3" 'select-window-3
  "4" 'select-window-4
  "6" 'enlarge-window
  "7" 'shrink-window
  "[" 'enlarge-window-horizontally
  "]" 'shrink-window-horizontally
  "w0" 'delete-window
  "w1" 'delete-other-windows
  "w2" 'split-window-below
  "w3" 'split-window-right
  ;; bookmarks
  "mst" 'bookmark-set
  "msv" 'bookmark-save
  "me" 'edit-bookmarks
  ;; git
  "g" 'magit-status
  ;; macro
  "mn" 'name-last-kbd-macro
  "mi" 'insert-kbd-macro
  "mo" 'open-kbd-macro-config
  ;; abbrev
  "aig" 'inverse-add-global-abbrev
  "ail" 'inverse-add-mode-abbrev
  "au" 'unexpand-abbrev
  "ae" 'edit-abbrevs
  "as" 'write-abbrev-file
  ;; project
  "pt" 'neotree-toggle
  "pr" 'neotree-refresh
  )

;; 显示相对行号
(global-display-line-numbers-mode)
(setq-default display-line-numbers-type 'relative)

;; 激活evil的leaderKey
(global-evil-leader-mode)
;; 开启evil模式
(evil-mode 1)
;; window-numbering
(window-numbering-mode 1)

(evil-leader/set-leader "<SPC>")

;; 清空evil insert模式的map,使用默认
(setcdr evil-insert-state-map nil)
(define-key evil-insert-state-map [escape] 'evil-normal-state)

;; 选中区域S(增加括号
(global-evil-surround-mode)

;;快速注释
(evilnc-default-hotkeys)
(define-key evil-normal-state-map (kbd ",/") 'evilnc-comment-or-uncomment-lines)
(define-key evil-visual-state-map (kbd ",/") 'evilnc-comment-or-uncomment-lines)

;; which-key
(which-key-mode 1)




(provide 'init-evil)
