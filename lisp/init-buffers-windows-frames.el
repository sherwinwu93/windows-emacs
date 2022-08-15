
;; ----------------------------------------files
(global-set-key (kbd "<f1>") 'find-file)
(define-key evil-normal-state-map (kbd "<SPC> f") 'find-file)
;; 更改默认目录
(setq default-directory "~/.emacs.d/")
;; 自动同步硬盘文件
(global-auto-revert-mode 1)
;; --------------------dired
(define-key evil-normal-state-map (kbd "<SPC> d") 'dired)
(global-set-key (kbd "<f2>") 'dired)
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
(global-set-key (kbd "C-x C-r") 'recentf-open-files)
;; ----------------------------------------buffers

(define-key evil-normal-state-map (kbd "<SPC> b") 'ivy-switch-buffer)

;; ----------------------------------------windows
;; 移动其它窗口
(define-key evil-normal-state-map (kbd "<SPC> j") 'scroll-other-window)
(define-key evil-normal-state-map (kbd "<SPC> k") 'scroll-other-window-down)
;; 绘制弹窗
(use-package popwin
  :config
  (popwin-mode 1)
  )
(window-numbering-mode 1)
(define-key evil-normal-state-map (kbd "<SPC> o") 'other-window)
(define-key evil-normal-state-map (kbd "<SPC> 0") 'select-window-0)
(define-key evil-normal-state-map (kbd "<SPC> 1") 'select-window-1)
(define-key evil-normal-state-map (kbd "<SPC> 2") 'select-window-2)
(define-key evil-normal-state-map (kbd "<SPC> 3") 'select-window-3)
(define-key evil-normal-state-map (kbd "<SPC> 4") 'select-window-4)
(define-key evil-normal-state-map (kbd "<SPC> -") 'shrink-window)
(define-key evil-normal-state-map (kbd "<SPC> =") 'enlarge-window)
(define-key evil-normal-state-map (kbd "<SPC> [") 'shrink-window-horizontally)
(define-key evil-normal-state-map (kbd "<SPC> ]") 'enlarge-window-horizontally)
(define-key evil-normal-state-map (kbd "<SPC> w0") 'delete-window)
(define-key evil-normal-state-map (kbd "<SPC> w1") 'delete-other-windows)
(define-key evil-normal-state-map (kbd "<SPC> w2") 'split-window-below)
(define-key evil-normal-state-map (kbd "<SPC> w3") 'split-window-right)
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
  :config
  (define-key evil-normal-state-local-map (kbd "TAB") 'neotree-enter)
  (define-key evil-normal-state-local-map (kbd "SPC") 'neotree-enter)
  (define-key evil-normal-state-local-map (kbd "q") 'neotree-hide)
  (define-key evil-normal-state-local-map (kbd "RET") 'neotree-enter)
  (define-key evil-normal-state-map (kbd "<SPC> pt") 'neotree-toggle)
  (define-key evil-normal-state-map (kbd "<SPC> pr") 'neotree-refresh)
  )

;; ----------------------------------------frames
(define-key evil-normal-state-map (kbd "<SPC> 50") 'delete-frame)
(define-key evil-normal-state-map (kbd "<SPC> 5o") 'other-frame)
(define-key evil-normal-state-map (kbd "<SPC> 52") 'make-frame)
(define-key evil-normal-state-map (kbd "<SPC> 55") 'find-file-other-frame)

(defun buffers-windows-frames()
  (interactive)
  (find-file "~/.emacs.d/lisp/init-buffers-windows-frames.el"))

(provide 'init-buffers-windows-frames)
