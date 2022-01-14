;;(package-initialize)

(add-to-list 'load-path "~/.emacs.d/lisp/")
;; ----------------------------------------包管理.放最上面
(require 'init-packages)
(require 'init-evil)
(require 'init-scheme)
;; ----------------------------------------macos
(require 'kbd-macros)
(require 'init-base)
;; (require 'init-evil)
(use-package magit
  :bind (("C-x g" . magit)))
;; 自动启用文本模式和自动换行模式
;; setq-default等价于Esc x set-variable 
(setq-default major-mode 'text-mode)
(add-hook 'text-mode-hook 'turn-on-auto-fill)
(setq-default fill-column 100)
;; 自动启用临时标记模式
(setq-default transient-mark-mode nil)
;; 解决控制问题
;;(enable-flow-control)
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
(setq default-directory "~/")
;; 添加永久缩写词汇
(setq-default abbrev-mode t)
(read-abbrev-file "~/.emacs.d/.abbrev_defs")
(setq save-abbrevs t)
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

;; ----------------------------------------简单的编辑器定义
;; 关闭工具栏
(tool-bar-mode -1)
;; 关闭文件滑动控件
(scroll-bar-mode -1)
;;更改光标样式
;; (setq cursor-type 'bar)
;; 全局而不是局部修改
(setq-default cursor-type 'bar)
;; 关闭启动帮助画面
;;(setq inhibit-splash-screen 1)
;; 关闭缩进
(electric-indent-mode -1)
;;更改显示字体大小
;;(set-face-attribute 'default nil :height 110)
;; 快速打开配置文件
(defun open-init-file()
  (interactive)
  (setq-default display-line-numbers 'relative)
  (find-file "~/.emacs.d/init.el"))
;; 将open-init-file绑定到<f9>上
;;(global-set-key (kbd "<f9>") 'open-init-file)
;; 开启全局Company补全
(global-company-mode 1)
;; 关闭自动生成备份文件
(setq make-backup-files nil)
;; ----------------------------------------最近打开过文件选项
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
(add-to-list 'my/packages 'dracula-theme)
(add-to-list 'my/packages 'monokai-theme)
(add-to-list 'my/packages 'spacemacs-dark-theme)
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
(setq org-agenda-files '("~/codes/notes/todos"))
;;设置org-agenda打开快捷键
(global-set-key (kbd "C-c a") 'org-agenda)
;; rime输入法
(require 'use-package)
(require 'posframe)
;; 让 use-package 永远按需安装软件包
(setq use-package-always-ensure t)

;; 之后就可以使用它了。
;; 要使用简体中文，记得修改defualt.yml
(use-package rime
  :custom
  (default-input-method "rime")
 :bind
  (:map rime-active-mode-map
   ("<tab>" . 'rime-inline-ascii)
   :map rime-mode-map
   ("C-`" . 'rime-send-keybinding)    ;; <---- 
   ("M-j" . 'rime-force-enable))
)
(setq rime-show-candidate 'posframe)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(display-line-numbers-type 'relative)
 '(global-display-line-numbers-mode t)
 '(package-selected-packages '(magit use-package rime better-defaults))
 '(show-paren-mode t)
 '(tool-bar-mode nil)
 '(transient-mark-mode nil))
;; 显示相对行号
(global-display-line-numbers-mode)
(setq display-line-numbers-type 'relative)
(setq-default display-line-numbers-type 'relative)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Consolas" :foundry "MS  " :slant normal :weight normal :height 105 :width normal)))))
