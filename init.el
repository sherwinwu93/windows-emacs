;; ----------配置插件源
 (when (>= emacs-major-version 24)
     (require 'package)
     (package-initialize)
     (setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
		      ("melpa" . "http://elpa.emacs-china.org/melpa/"))))
;; 注意 elpa.emacs-china.org 是 Emacs China 中文社区在国内搭建的一个 ELPA 镜像
 ;; cl - Common Lisp Extension
 (require 'cl)
 ;; Add Packages
 (defvar my/packages '(
		;; --- Auto-completion ---
		company
		;; --- Better Editor ---
		hungry-delete
		swiper
		counsel
		smartparens
		;; --- Major Mode ---
		js2-mode
		;; --- Minor Mode ---
		nodejs-repl
		exec-path-from-shell
		;; --- Themes ---
		monokai-theme
		;; solarized-theme
		) "Default packages")
 (setq package-selected-packages my/packages)
 (defun my/packages-installed-p ()
     (loop for pkg in my/packages
	   when (not (package-installed-p pkg)) do (return nil)
	   finally (return t)))
 (unless (my/packages-installed-p)
     (message "%s" "Refreshing package database...")
     (package-refresh-contents)
     (dolist (pkg my/packages)
       (when (not (package-installed-p pkg))
	 (package-install pkg))))
 ;; Find Executable Path on OS X
 (when (memq window-system '(mac ns))
   (exec-path-from-shell-initialize))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Consolas" :foundry "outline" :slant normal :weight normal :height 105 :width normal)))))
;; 自动启用文本模式和自动换行模式
;; setq-default等价于Esc x set-variable 
(setq-default major-mode 'text-mode)
(add-hook 'text-mode-hook 'turn-on-auto-fill)
;; 自动启用临时标记模式
(setq-default transient-mark-mode nil)
;; 解决控制问题
;; 重新绑定键盘按键
(global-unset-key "\e\e")
(global-unset-key "\C-x\C-u")
;; 绑定按键到功能
(define-key global-map "\C-x?" 'help-command)
;;(define-key global-map "\C-h" 'backward-char)
;; 关闭按键提示功能
(setq suggest-key-bindings nil)
;; 设置查询不区分大小写: t不区分,nil区分
(setq-default case-fold-search t)
;; 替换时不改变大小写情况
(setq-default case-replace nil)
;; 更改默认目录
(setq default-directory "d:/git-code/")
;; 添加永久缩写词汇
(setq-default abbrev-mode t)
(read-abbrev-file "~/.emacs.d/.abbrev_defs")
(setq save-abbrevs t)
(fset 'test-macro
      (kmacro-lambda-form [return] 0 "%d"))
;; 键位映射图增加定义的方法
;;(define-key keymap "keystroke" 'command-name)
;;(global-set-key "keystroke" 'command-name)
;;(local-set-key "keystore" 'command-name)
;;(define-key global-map "\C-x1" 'goto-line)
;;(global-set-key "\C-x1" 'goto-line)
(put 'erase-buffer 'disabled nil)
;; autoload加载程序包
;; (auto-load 'function "filename")
;; 启动ada-mode时,加载ada
;; (auto-load 'ada-mode "ada")
(setq auto-mode-alist
  (append
     ;; File name ends in ‘.C’.
     '(("\\.ada\\'" . js-mode))
     auto-mode-alist))

;; -------简单的编辑器定义
;; 关闭工具栏
(tool-bar-mode -1)
;; 关闭文件滑动控件
(scroll-bar-mode -1)
;; 显示行号
(global-linum-mode 1)
;;更改光标样式
;; (setq cursor-type 'bar)
;; 全局而不是局部修改
;; (setq-default cursor-type 'bar)
;; 关闭启动帮助画面
(setq inhibit-splash-screen 1)
;; 关闭缩进
(electric-indent-mode -1)
;;更改显示字体大小
;;(set-face-attribute 'default nil :height 110)
;; 快速打开配置文件
(defun open-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))
;; 将open-init-file绑定到<f5>上
(global-set-key (kbd "<f5>") 'open-init-file)
;; 开启全局Company补全
(global-company-mode 1)
;; 关闭自动生成备份文件
(setq make-backup-files nil)
;; -------最近打开过文件选项
;; 从文件中加载特性
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-item 10)
(global-set-key (kbd "C-x C-r") 'recentf-open-files)
;;选中输入时,替换而不是增加
(delete-selection-mode 1)
;;设置Emacs默认全屏
;;(setq initial-frame-alist '((fullscreen . maximized)))
;;设置hook,自动括号匹配
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)
;;高亮当前行
(global-hl-line-mode 1)
;;安装主题
(add-to-list 'my/packages 'monokai-theme)
(load-theme 'monokai 1)
;;设置js2-mode
(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode))
       auto-mode-alist))
;; org-mode文本内语法高亮
(require 'org)
(setq org-src-fontify-natively t)
;;Agenda的使用
;;设置默认Org Agenda文件目录
(setq org-agenda-files '("d:/git-code/notes/todos"))
;;设置org-agenda打开快捷键
(global-set-key (kbd "C-c a") 'org-agenda)
