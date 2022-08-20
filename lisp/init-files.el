;; ----------------------------------------tab
(require 'init-tab)

;; ----------------------------------------files
(evil-leader/set-key "d" 'find-file)
;; 更改默认目录
(setq default-directory "~/notes/")
;; 自动同步硬盘文件
(global-auto-revert-mode 1)
;; --------------------dired
;; --------------------auto save
;; 自动保存
(require 'auto-save)
(auto-save-enable)
;; 关闭生成init.el~文件
(setq make-backup-files nil)
;; 关闭auto-save目录的文件
(setq auto-save-default nil)
(setq auto-save-silent t)   ; quietly save
(setq auto-save-disable-predicates
      '((lambda ()
	  (string-suffix-p
	   "gpg"
	   (file-name-extension (buffer-name)) t))))
;; --------------------最近打开
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-item 10)
(evil-leader/set-key "h" 'recentf-open-files)
;; ----------------------------------------buffers
(evil-leader/set-key "b" 'ivy-switch-buffer)

;; ----------------------------------------windows
;; 绘制弹窗
(use-package popwin
  :config
  (popwin-mode 1)
  )
(window-numbering-mode 1)
(evil-leader/set-key
  "o" 'other-window
  "-" 'shrink-window
  "=" 'enlarge-window
  "[" 'shrink-window-horizontally
  "]" 'enlarge-window-horizontally
  "w0" 'delete-window
  "w1" 'delete-other-windows
  "w2" 'split-window-below
  "w3" 'split-window-right
  "1" 'select-window-1
  "2" 'select-window-2
  "3" 'select-window-3
  "4" 'select-window-4
  "5" 'select-window-5
  )
;; 设置dired-mode只有一个buffer
(put 'dired-find-alternate-file 'disabled nil)
(with-eval-after-load 'dired
  (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file))
;; ----------------------------------------frames

(defun files-file()
  (interactive)
  (find-file "~/.emacs.d/lisp/init-files.el"))

(provide 'init-files)
