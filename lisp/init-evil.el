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
(defun open-evil-file()
  (interactive)
  (find-file "~/.emacs.d/lisp/init-evil.el"))
;; evil leaderKey
(evil-leader/set-key
  ;; file
 "d" 'dired
 "ff" 'find-file
 "fs" 'save-buffer
 "fr" 'dired-do-rename
 ;; buffer
 "bb" 'switch-to-buffer
 "bl" 'list-buffers
 ;; 需要设置window-numbering生效
 ;; "0" 'select-window-0
 ;; window
 "1" 'select-window-1
 "2" 'select-window-2
 "3" 'select-window-3
 "4" 'select-window-4
 "w0" 'delete-window
 "w1" 'delete-other-windows
 "w2" 'split-window-below
 "w3" 'split-window-right
 ":" 'counset-M-x
 ;; git
 "g" 'magit-status
 ;; macro
 "mn" 'name-last-kbd-macro
 "mi" 'insert-kbd-macro
 "mo" 'open-kbd-macro-config
)

(provide 'init-evil)
