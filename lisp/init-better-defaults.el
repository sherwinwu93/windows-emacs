;; ----------------------------------------其他
;; which-key
(which-key-mode 1)
;; 关闭按键提示功能
(setq suggest-key-bindings nil)
;; yes no -> y n
(fset 'yes-or-no-p 'y-or-n-p)
;; ----------------------------------------系统级按键
(global-set-key (kbd "<escape>")  'keyboard-escape-quit)
;; 改键<menu>为modifier
(define-key global-map (kbd "<menu>") nil)
(define-key key-translation-map (kbd "<menu>") 'event-apply-super-modifier)
(define-key key-translation-map (kbd "<f5>") (kbd "C-c"))
(define-key key-translation-map (kbd "<f6>") (kbd "C-x"))
(define-key key-translation-map (kbd "<f8>") (kbd "C-h"))

;; ----------------------------------------Emacs画面
;;设置Emacs默认全屏
;;(setq initial-frame-alist '((fullscreen . maximized)))
;; 关闭启动帮助画面
(setq inhibit-splash-screen 1)
;; 关闭工具栏
(tool-bar-mode -1)
;; 关闭菜单栏
(menu-bar-mode -1)
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
(load-theme 'monokai 1)
;; (require 'spacemacs-dark-theme)
;; (load-theme 'spacemacs-dark 1)
;; (use-package jetbrains-darcula-theme
;;   :config
;;   (load-theme 'jetbrains-darcula t))


(defun better-defaults-file()
  (find-file "~/.emacs.d/lisp/init-better-defaults.el"))

(provide 'init-better-defaults)
