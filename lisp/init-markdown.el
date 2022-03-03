;;-------------------------
;; 配置markdown语法支持
;;-------------------------
(use-package markdown-mode) ;; 依赖markdown-mode包
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))

(provide 'init-markdown)
