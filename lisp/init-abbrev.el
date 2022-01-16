;; 添加永久缩写词汇
(setq-default abbrev-mode t)
(read-abbrev-file "~/.emacs.d/.abbrev_defs")
(setq save-abbrevs t)

(provide 'init-abbrev)
