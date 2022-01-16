(require 'org)
;; org-mode文本内语法高亮
(setq org-src-fontify-natively t)
;;Agenda的使用
;;设置默认Org Agenda文件目录
(setq org-agenda-files '("~/codes/notes/todos"))
;;设置org-agenda打开快捷键
(global-set-key (kbd "C-c a") 'org-agenda)

(provide 'init-org)
