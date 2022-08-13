(use-package monokai-theme)
(use-package ivy
  :ensure t
  :diminish ivy-mode
  :hook (after-init . ivy-mode))
;;(use-package spacemacs-theme)

;; ----------------------------------------其他
;; 关闭按键提示功能
(setq suggest-key-bindings nil)
;; yes no -> y n
(fset 'yes-or-no-p 'y-or-n-p)

;; ----------------------------------------Emacs画面
;;设置Emacs默认全屏
;;(setq initial-frame-alist '((fullscreen . maximized)))
;; 关闭启动帮助画面
(setq inhibit-splash-screen 1)
;; 关闭工具栏
(tool-bar-mode -1)
;; 关闭菜单栏
(menu-bar-mode 1)
;; 关闭文件滑动控件
(scroll-bar-mode -1)
;; ----------主题
;;(load-theme 'spacemacs-dark 1)
(load-theme 'monokai 1)
;; ----------字体
;; 字体大小
;;(set-face-attribute 'default nil :height 105)
;; 字体行间距
(setq-default line-spacing 0.2)


(provide 'init-better-defaults)
