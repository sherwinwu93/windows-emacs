(use-package evil)
(use-package evil-leader)
(use-package window-numbering)
(use-package evil-surround)
(use-package evil-nerd-commenter)
(use-package which-key)
;; 激活evil的leaderKey
(global-evil-leader-mode)
;; 开启evil模式
(evil-mode 1)
;; 清空evil insert模式的map
(setcdr evil-insert-state-map nil)
(define-key evil-insert-state-map [escape] 'evil-normal-state)

;; window-numbering
(window-numbering-mode 1)

;; 快速匹配,选中区域同时增加括号
(global-evil-surround-mode)

;;快速注释
(evilnc-default-hotkeys)
(define-key evil-normal-state-map (kbd ",/") 'evilnc-comment-or-uncomment-lines)
(define-key evil-visual-state-map (kbd ",/") 'evilnc-comment-or-uncomment-lines)

;; which-key 
(which-key-mode 1)

(evil-leader/set-leader "<SPC>")
;; evil leaderKey
(evil-leader/set-key
 "ff" 'find-file
 "bb" 'switch-to-buffer
 ;; 需要设置window-numbering生效
 "0" 'select-window-0
 "1" 'select-window-1
 "2" 'select-window-2
 "3" 'select-window-2
 "w/" 'split-window-right
 "w-" 'split-window-below
 ":" 'counset-M-x
 "wM" 'delete-other-windows
)

(provide 'init-evil)
