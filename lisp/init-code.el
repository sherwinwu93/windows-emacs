;; ----------------------------------------查找和替换
;; 设置查询不区分大小写: t不区分,nil区分
(setq-default case-fold-search t)
;; 替换时不改变大小写情况
(setq-default case-replace nil)
;; --------------------代码缩进
(defun indent-buffer()
  (interactive)
  (indent-region (point-min) (point-max)))

(defun indent-region-or-buffer()
  (interactive)
  (save-excursion
    (if (region-active-p)
	(progn
	  (indent-region (region-beginning) (region-end))
	  (message "Indent selected region."))
      (progn
	(indent-buffer)
	(message "Indent buffer.")))))
(global-set-key (kbd "C-M-l") 'indent-region-or-buffer)
;; --------------------代码补全
(use-package company)
(setq-default abbrev-mode t)
(define-abbrev-table 'global-abbrev-table '(
					    ("wusd" "wushengdong" nil :count 11)
					    ("lij" "lijie")
					    ))
(define-abbrev-table 'org-mode-abbrev-table
  '(
    ("ail" "add-inverse-local" nil :count 1)
   ))
;; --------------------Hippie补全
;; 'hippie-expand
(setq hippie-expand-try-function-list '(try-expand-debbrev
					try-expand-debbrev-all-buffers
					try-expand-debbrev-from-kill
					try-complete-file-name-partially
					try-complete-file-name
					try-expand-all-abbrevs
					try-expand-list
					try-expand-line
					try-complete-lisp-symbol-partially
					try-complete-lisp-symbol))
;; --------------------括号
(define-advice show-paren-function (:around (fn) fix-show-paren-function)
  "Highlight enclosing parens."
  (cond ((looking-at-p "\\s(") (funcall fn))
	(t (save-excursion
	     (ignore-errors (backward-up-list))
	     (funcall fn)))))

(provide 'init-code)
