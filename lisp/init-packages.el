;; ----------------------------------------配置插件源
 (when (>= emacs-major-version 24)
     (require 'package)
     (package-initialize)
     (setq package-archives '(("gnu" . "http://mirrors.ustc.edu.cn/elpa/gnu/")
                         ("melpa" . "http://mirrors.ustc.edu.cn/elpa/melpa/")
                         ("org" . "http://mirrors.ustc.edu.cn/elpa/org/"))))
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
		zenburn-theme
		dracula-theme
		;; solarized-theme
		;; rime
		use-package
		posframe
		) "Default packages")
(provide 'init-packages)
