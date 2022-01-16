;; ----------------------------------------配置插件源
(when (>= emacs-major-version 24)
   (require 'package)
   (package-initialize)
     (setq package-archives '(("gnu" . "http://mirrors.ustc.edu.cn/elpa/gnu/")
                              ("melpa" . "http://mirrors.ustc.edu.cn/elpa/melpa/")
                              ("org" . "http://mirrors.ustc.edu.cn/elpa/org/"))))
;; cl - Common Lisp Extension
(require 'cl)
;; 包名列表
(defvar my/packages '(
		      use-package
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
		      spacemacs-theme
		      ;; solarized-theme
		      ;; --- input ---
		      ;; rime
		      cnfonts
		      posframe
		      ;; --- vc ---
		      magit
		      ;; --- evil ---
		      evil
		      evil-leader
		      window-numbering
		      evil-surround
		      evil-nerd-commenter
		      which-key
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

(provide 'init-packages)
