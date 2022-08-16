;; ----------------------------------------其他
(define-key key-translation-map (kbd "<menu>") (kbd "<menu>"))
(global-set-key (kbd "<menu>") nil)
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
;; --------------------interactive
(use-package ivy
  :ensure t
  :diminish ivy-mode
  :hook (after-init . ivy-mode))
(use-package swiper)
(use-package counsel)

;; ----------------------------------------主题
(use-package monokai-theme)
(load-theme 'monokai 1)
;;(use-package spacemacs-theme)
;;(load-theme 'spacemacs-dark 1)

(defun better-defaults-file()
  (find-file "~/.emacs.d/lisp/init-better-defaults.el"))


(provide 'init-better-defaults)
