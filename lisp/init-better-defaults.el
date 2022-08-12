(use-package hungry-delete)
(use-package swiper)
(use-package counsel)
(use-package smartparens)
(use-package popwin)
(use-package company)
(when (fboundp 'set-charset-priority)
    (set-charset-priority 'unicode))
  (prefer-coding-system 'utf-8)
  (setq locale-coding-system 'utf-8)
  (setq system-time-locale "C")
  (unless (eq system-type 'windows-nt)
    (set-selection-coding-system 'utf-8))
;; 初始化时打开
(use-package monokai-theme)
;;(use-package spacemacs-theme)
(require 'recentf)
(require 'auto-save)
;; ----------------------------------------其他
;; 关闭按键提示功能
(setq suggest-key-bindings nil)
;; 解决控制问题
;;(enable-flow-control)
;;设置hook,自动括号匹配
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)
;; yes no -> y n
(fset 'yes-or-no-p 'y-or-n-p)
;; ----------------------------------------改按键
;;(global-set-key (kbd "<f1>") 'find-file)
;; ----------------------------------------帮助


;; ----------------------------------------Emacs画面
;; 关闭启动帮助画面
(setq inhibit-splash-screen 1)
;; 关闭工具栏
(tool-bar-mode -1)
;; 关闭菜单栏
(menu-bar-mode 1)
;; 关闭文件滑动控件
(scroll-bar-mode -1)
;; 括号模式
(show-paren-mode 1)
;; 高亮当前行
(global-hl-line-mode 1)
;;设置Emacs默认全屏
(setq initial-frame-alist '((fullscreen . maximized)))
;; 更改光标样式,全局而不是局部修改
(setq-default cursor-type 'bar)
;; ----------主题
;;(load-theme 'spacemacs-dark 1)
(load-theme 'monokai 1)
;; ----------字体
;; 字体大小
(set-face-attribute 'default nil :height 110)
;; 字体行间距
(setq-default line-spacing 0.1)


;; ----------------------------------------文件
;; 更改默认目录
(setq default-directory "/mnt/d/git-code/")
;; 外界修改过文件,自动加载
(global-auto-revert-mode 1)
;; 关闭生成init.el~文件
(setq make-backup-files nil)
;; 关闭auto-save目录的文件
(setq auto-save-default nil)
;; --------------------最近打开
;; 从文件中加载特性
(recentf-mode 1)
(setq recentf-max-menu-item 10)
(global-set-key (kbd "C-x C-r") 'recentf-open-files)

;; --------------------文件编辑
;; 设置自动换行字数
(setq-default fill-column 100)
;; 临时标记模式
(setq-default transient-mark-mode nil)
;; 选中时输入替换
(delete-selection-mode 1)
;; 关闭缩进
;; (electric-indent-mode -1)
;; 开启全局Company补全
(global-company-mode 1)
;;选中输入时,替换而不是增加
(delete-selection-mode 1)
;; --------------------文件自动保存
(auto-save-enable)

(setq auto-save-silent t)   ; quietly save
(setq auto-save-delete-trailing-whitespace t)  ; automatically delete spaces at the end of the line when saving

;;; custom predicates if you don't want auto save.
;;; disable auto save mode when current filetype is an gpg file.
(setq auto-save-disable-predicates
      '((lambda ()
      (string-suffix-p
      "gpg"
      (file-name-extension (buffer-name)) t))))



;; ----------------------------------------window`buffer
;; 绘制弹窗
(popwin-mode 1)




(provide 'init-better-defaults)
