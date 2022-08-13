(use-package popwin)
;; ----------------------------------------project
(use-package projectile
  :config
  ;; 把它的缓存挪到 ~/.emacs.d/.cache/ 文件夹下，让 gitignore 好做
  (setq projectile-cache-file (expand-file-name ".cache/projectile.cache" user-emacs-directory))
  ;; 全局 enable 这个 minor mode
  (projectile-mode 1)
  ;; 定义和它有关的功能的 leader key
  (define-key projectile-mode-map (kbd "C-c C-p") 'projectile-command-map))
(use-package neotree)
(add-hook 'neotree-mode-hook
          (lambda ()
            (define-key evil-normal-state-local-map (kbd "TAB") 'neotree-enter)
            (define-key evil-normal-state-local-map (kbd "SPC") 'neotree-enter)
            (define-key evil-normal-state-local-map (kbd "q") 'neotree-hide)
            (define-key evil-normal-state-local-map (kbd "RET") 'neotree-enter)))
(define-key evil-normal-state-map (kbd "<SPC> pt") 'neotree-toggle)
(define-key evil-normal-state-map (kbd "<SPC> pr") 'neotree-refresh)

;; (define-key evil-normal-state-map (kbd "") ')
;; ----------------------------------------files
;; 更改默认目录
(setq default-directory "/mnt/d/git-code/")
;; 外界修改过文件,自动加载
(global-auto-revert-mode 1)
;; 关闭生成init.el~文件
(setq make-backup-files nil)
;; 关闭auto-save目录的文件
(setq auto-save-default nil)
;; 自动保存
(require 'auto-save)
(require 'recentf)
;; --------------------最近打开
;; 从文件中加载特性
(recentf-mode 1)
(setq recentf-max-menu-item 10)
;; --------------------文件自动保存
(auto-save-enable)

(setq auto-save-silent t)   ; quietly save
;;(setq auto-save-delete-trailing-whitespace t)  ; automatically delete spaces at the end of the line when saving

;;; custom predicates if you don't want auto save.
;;; disable auto save mode when current filetype is an gpg file.
(setq auto-save-disable-predicates
      '((lambda ()
      (string-suffix-p
      "gpg"
      (file-name-extension (buffer-name)) t))))
;; --------------------dired
;; 设置dired-mode只有一个buffer
;; (put 'dired-find-alternate-file 'disabled nil)
(with-eval-after-load 'dired
  (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file))
(global-set-key (kbd "C-x C-r") 'recentf-open-files)
(define-key evil-normal-state-map (kbd "<SPC> d") 'dired)
(define-key evil-normal-state-map (kbd "<SPC> f") 'find-file)
(define-key evil-normal-state-map (kbd "<SPC> s") 'save-buffer)
(define-key evil-normal-state-map (kbd "<SPC> r") 'recentf-open-files)

;; ----------------------------------------buffers
(define-key evil-normal-state-map (kbd "<SPC> bb") 'ivy-switch-buffer)
(define-key evil-normal-state-map (kbd "<SPC> bl") 'list-buffers)

;; ----------------------------------------windows
;; 绘制弹窗
(popwin-mode 1)
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

;; frames
(define-key evil-normal-state-map (kbd "<SPC> 50") 'delete-frame)
(define-key evil-normal-state-map (kbd "<SPC> 5o") 'other-frame)
(define-key evil-normal-state-map (kbd "<SPC> 52") 'make-frame)
(define-key evil-normal-state-map (kbd "<SPC> 55") 'find-file-other-frame)


(provide 'init-buffers-windows-frames)
