;;(package-initialize)
;; 递归遍历加载路径
(defun add-subdirs-to-load-path(dir)
  "Recursive add directories to `load-path`"
  (let ((default-directory (file-name-as-directory dir)))
    (add-to-list 'load-path dir)
    (normal-top-level-add-subdirs-to-load-path)))

(add-subdirs-to-load-path "~/.emacs.d/lisp/")
(defun init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))
(defun load-init-file()
  (interactive)
  (load-file "~/.emacs.d/init.el"))
;; ----------------------------------------包管理和evil放最上面
(require 'init-packages)
(require 'init-evil)
;; ----------------------------------------
(require 'init-better-defaults)
(require 'init-files)
(require 'init-edit)
(require 'init-kbd-macros)
;; ----------------------------------------
(require 'init-vc)
(require 'init-org)
(require 'init-shell)
(require 'init-input)
;; ----------------------------------------语言
(require 'init-project)
(require 'init-scheme)
(require 'init-js)
(require 'init-markdown)
(require 'init-translate)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(avy smex jetbrains-darcula-theme youdao-dictionary org-pomodoro markdown-mode google-translate jdee neotree projectile web-mode rime posframe cnfonts magit spacemacs-theme window-numbering which-key use-package smartparens popwin nodejs-repl monokai-theme js2-mode hungry-delete exec-path-from-shell evil-surround evil-nerd-commenter evil-leader counsel company))
 '(show-paren-mode t)
 '(tool-bar-mode nil)
 '(transient-mark-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Consolas" :foundry "outline" :slant normal :weight normal :height 105 :width normal)))))
