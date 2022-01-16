;; ----------------------------------------其他
;; 关闭按键提示功能
(setq suggest-key-bindings nil)
;; 解决控制问题
;;(enable-flow-control)
;;设置hook,自动括号匹配
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)
;; yes no -> y n
(fset 'yes-or-no-p 'y-or-n-p)


;; ----------------------------------------编辑模式
;; 默认文本模式模式
(setq-default major-mode 'text-mode)
;; 换行模式
(add-hook 'text-mode-hook 'turn-on-auto-fill)
;; 启动ada-mode时,加载ada
;; (auto-load 'ada-mode "ada")
;; 打开文件自动匹配mode
(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode))
       auto-mode-alist))


;; ----------------------------------------Emacs画面
;; 关闭启动帮助画面
(setq inhibit-splash-screen 1)
;; 关闭菜单栏
(menu-bar-mode -1)
;; 关闭工具栏
(tool-bar-mode -1)
;; 括号模式
(show-paren-mode 1)
;; 关闭文件滑动控件
(scroll-bar-mode -1)
;; 高亮当前行
(global-hl-line-mode 1)
;;设置Emacs默认全屏
;;(setq initial-frame-alist '((fullscreen . maximized)))
;; 更改光标样式,全局而不是局部修改
(setq-default cursor-type 'bar)
;; ----------主题
(add-to-list 'my/packages 'dracula-theme)
(add-to-list 'my/packages 'monokai-theme)
(add-to-list 'my/packages 'spacemacs-dark-theme)
(load-theme 'spacemacs-dark 1)
;; ----------字体
;; 字体大小
;;(set-face-attribute 'default nil :height 110)
;; 字体行间距
(setq-default line-spacing 0.1)


;; ----------------------------------------文件
;; 更改默认目录
(setq default-directory "~/")
;; 关闭生成init.el~文件
(setq make-backup-files nil)
;; 关闭auto-save目录的文件
;;(setq auto-save-default nil)
;; --------------------最近打开
;; 从文件中加载特性
(require 'recentf)
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
(electric-indent-mode -1)
;; 开启全局Company补全
(global-company-mode 1)
;;选中输入时,替换而不是增加
(delete-selection-mode 1)


;; ----------------------------------------查找和替换
;; 设置查询不区分大小写: t不区分,nil区分
(setq-default case-fold-search t)
;; 替换时不改变大小写情况
(setq-default case-replace nil)




(provide 'init-better-defaults)