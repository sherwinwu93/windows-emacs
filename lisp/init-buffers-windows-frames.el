
;; ----------------------------------------files
(define-key global-map (kbd "<menu> f") 'find-file)
;; 更改默认目录
(setq default-directory "~/notes/")
;; 自动同步硬盘文件
(global-auto-revert-mode 1)
;; --------------------neotree
(global-set-key (kbd "<menu> p") 'neotree-toggle)
(defun neotree-doc()
  (interactive)
  (find-file "~/.emacs.d/lisp/neotree.org"))
;; --------------------dired
(define-key global-map (kbd "<menu> d") 'dired)
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
(global-set-key (kbd "<menu> r") 'recentf-open-files)
;; ----------------------------------------buffers

(define-key global-map (kbd "<menu> b") 'ivy-switch-buffer)

;; ----------------------------------------windows
;; 移动其它窗口
(define-key global-map (kbd "<menu> j") 'scroll-other-window)
(define-key global-map (kbd "<menu> k") 'scroll-other-window-down)
;; 绘制弹窗
(use-package popwin
  :config
  (popwin-mode 1)
  )
(window-numbering-mode 1)
(define-key global-map (kbd "<menu> o") 'other-window)
(define-key global-map (kbd "<menu> -") 'shrink-window)
(define-key global-map (kbd "<menu> =") 'enlarge-window)
(define-key global-map (kbd "<menu> [") 'shrink-window-horizontally)
(define-key global-map (kbd "<menu> ]") 'enlarge-window-horizontally)
(define-key global-map (kbd "<menu> 0") 'delete-window)
(define-key global-map (kbd "<menu> 1") 'delete-other-windows)
(define-key global-map (kbd "<menu> 2") 'split-window-below)
(define-key global-map (kbd "<menu> 3") 'split-window-right)
;; 设置dired-mode只有一个buffer
(put 'dired-find-alternate-file 'disabled nil)
(with-eval-after-load 'dired
  (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file))
;; --------------------project
(use-package projectile
  :config
  ;; 把它的缓存挪到 ~/.emacs.d/.cache/ 文件夹下，让 gitignore 好做
  (setq projectile-cache-file (expand-file-name ".cache/projectile.cache" user-emacs-directory))
  ;; 全局 enable 这个 minor mode
  (projectile-mode 1)
  ;; 定义和它有关的功能的 leader key
  (define-key projectile-mode-map (kbd "C-c C-p") 'projectile-command-map))
(use-package neotree
 )

;; ----------------------------------------frames
(define-key evil-normal-state-map (kbd "<menu> 50") 'delete-frame)
(define-key evil-normal-state-map (kbd "<menu> 5o") 'other-frame)
(define-key evil-normal-state-map (kbd "<menu> 52") 'make-frame)
(define-key evil-normal-state-map (kbd "<menu> 55") 'find-file-other-frame)

(defun buffers-windows-frames-file()
  (interactive)
  (find-file "~/.emacs.d/lisp/init-buffers-windows-frames.el"))

(provide 'init-buffers-windows-frames)
