;;(package-initialize)
;; 递归遍历加载路径
(defun add-subdirs-to-load-path(dir)
  "Recursive add directories to `load-path`"
  (let ((default-directory (file-name-as-directory dir)))
    (add-to-list 'load-path dir)
    (normal-top-level-add-subdirs-to-load-path)))

(add-subdirs-to-load-path "~/.emacs.d/lisp/")
;; ----------------------------------------包管理.放最上面
(require 'init-packages)
;; ----------------------------------------
(require 'init-evil)
(require 'init-better-defaults)
(require 'init-code)
(require 'init-kbd-macros)
(require 'init-helm)
;; ----------------------------------------
(require 'init-vc)
(require 'init-org)
(require 'init-dired)
(require 'init-shell)
(require 'init-input)
;; ----------------------------------------语言
;; (require 'init-translate)
(require 'init-scheme)
(require 'init-js)
(require 'init-project)
(require 'init-markdown)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(markdown-mode google-translate jdee neotree projectile web-mode rime posframe cnfonts magit spacemacs-theme window-numbering which-key use-package smartparens popwin nodejs-repl monokai-theme js2-mode hungry-delete exec-path-from-shell evil-surround evil-nerd-commenter evil-leader counsel company)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
