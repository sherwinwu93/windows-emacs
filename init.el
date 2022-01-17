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
(require 'init-scheme)
(require 'init-js)
