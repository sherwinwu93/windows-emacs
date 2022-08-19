;; ----------------------------------------tab
(require 'init-tab)

;; ----------------------------------------files
(define-key global-map (kbd "s-d") 'find-file)
(define-key global-map (kbd "s-f") 'find-file)
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
;; (global-set-key (kbd "s-h") 'recentf-open-files)
;; ----------------------------------------buffers
(define-key global-map (kbd "s-b") 'list-buffers)
(define-key global-map (kbd "s-<menu>") 'ivy-switch-buffer)

;; ----------------------------------------windows
;; 移动其它窗口
(define-key global-map (kbd "s-j") 'scroll-other-window)
(define-key global-map (kbd "s-k") 'scroll-other-window-down)
;; 绘制弹窗
(use-package popwin
  :config
  (popwin-mode 1)
  )
(window-numbering-mode 1)
(define-key global-map (kbd "s-o") 'other-window)
(define-key global-map (kbd "s--") 'shrink-window)
(define-key global-map (kbd "s-=") 'enlarge-window)
(define-key global-map (kbd "s-;") 'shrink-window-horizontally)
(define-key global-map (kbd "s-'") 'enlarge-window-horizontally)
(define-key global-map (kbd "s-0") 'delete-window)
(define-key global-map (kbd "s-1") 'delete-other-windows)
(define-key global-map (kbd "s-2") 'split-window-below)
(define-key global-map (kbd "s-3") 'split-window-right)
;; 设置dired-mode只有一个buffer
(put 'dired-find-alternate-file 'disabled nil)
(with-eval-after-load 'dired
  (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file))
;; ----------------------------------------frames
(define-key evil-normal-state-map (kbd "s-5 0") 'delete-frame)
(define-key evil-normal-state-map (kbd "s-5 o") 'other-frame)
(define-key evil-normal-state-map (kbd "s-5 2") 'make-frame)
(define-key evil-normal-state-map (kbd "s-5 5") 'find-file-other-frame)

(defun files-file()
  (interactive)
  (find-file "~/.emacs.d/lisp/init-files.el"))

(provide 'init-files)
