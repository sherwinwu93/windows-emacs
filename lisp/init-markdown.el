;;-------------------------
;; 配置markdown语法支持
;;-------------------------
(use-package markdown-mode) ;; 依赖markdown-mode包
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))

(defun markdown-file()
  (interactive)
  (find-file "~/.emacs.d/lisp/init-markdown.el"))

(provide 'init-markdown)
