
;; ----------------------------------------Search and Replace
;; --------------------Search
;; 设置查询不区分大小写: t不区分,nil区分
(setq-default case-fold-search t)
;; 替换时不改变大小写情况
(setq-default case-replace nil)
;; ----------------------------------------Edit
;; (define-key global-map (kbd "M-<return>") 'newline-and-indent)
;; 设置自动换行字数
(setq-default fill-column 1024)
;; 临时标记模式
(setq-default transient-mark-mode nil)
;;选中输入时,替换而不是增加
(delete-selection-mode 1)
;; 关闭缩进
;; (electric-indent-mode -1)
;; --------------------Font
;; 字体大小
;;(set-face-attribute 'default nil :height 105)
;; 字体行间距
(setq-default line-spacing 0.2)
;; --------------------兼容windows编码
(when (fboundp 'set-charset-priority)
  (set-charset-priority 'unicode))
(prefer-coding-system 'utf-8)
(setq locale-coding-system 'utf-8)
(setq system-time-locale "C")
(unless (eq system-type 'windows-nt)
  (set-selection-coding-system 'utf-8))
(setq default-buffer-file-coding-system 'utf-8-unix)
;; --------------------Display
;; 光标
(setq-default cursor-type 'bar)
;; 高亮当前行
(global-hl-line-mode 1)
;; 显示相对行号
(global-display-line-numbers-mode 1)
(setq-default display-line-numbers-type 'relative)

;; ----------------------------------------Code
(use-package hungry-delete)
;; --------------------Abbreviation
(setq-default abbrev-mode t)
(read-abbrev-file "~/.emacs.d/abbrev_defs")
(define-key evil-normal-state-map (kbd "<SPC> ai") 'inverse-add-global-abbrev)
(define-key evil-normal-state-map (kbd "<SPC> al") 'inverse-add-mode-abbrev)
(define-key evil-normal-state-map (kbd "<SPC> au") 'unexpand-abbrev)
(define-key evil-normal-state-map (kbd "<SPC> ae") 'edit-abbrevs)
(define-key evil-normal-state-map (kbd "<SPC> as") 'write-abbrev-file)
;; --------------------Hippie补全
;; 开启全局Company补全
(use-package company
  :config
  (global-company-mode 1)
  )
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
;; --------------------Formatting
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
;; --------------------括号
(use-package smartparens
  :config
  ;; 括号展示
  ;; 括号模式
  (show-paren-mode 1)
  (define-advice show-paren-function (:around (fn) fix-show-paren-function)
    "Highlight enclosing parens."
    (cond ((looking-at-p "\\s(") (funcall fn))
	  (t (save-excursion
	       (ignore-errors (backward-up-list))
	       (funcall fn)))))
  ;;设置hook,自动括号匹配
  (add-hook 'emacs-lisp-mode-hook 'show-paren-mode)
  )
;; 选中区域S(增加括号
(global-evil-surround-mode)
;; --------------------注释
;;快速注释
(evilnc-default-hotkeys)
(define-key evil-normal-state-map (kbd ",/") 'evilnc-comment-or-uncomment-lines)
(define-key evil-visual-state-map (kbd ",/") 'evilnc-comment-or-uncomment-lines)

;; --------------------bookmarks
(defun bookmark-set$save()
  (interactive)
  (bookmark-set)
  (bookmark-save))
(define-key global-map (kbd "C-x rs") 'bookmark-set$save)
(define-key evil-normal-state-map (kbd ",mi") 'bookmark-set)
(define-key evil-normal-state-map (kbd ",ms") 'bookmark-save)
(define-key evil-normal-state-map (kbd ",me") 'edit-bookmarks)

(defun edit-file()
  (interactive)
  (find-file "~/.emacs.d/lisp/init-edit.el"))
(provide 'init-edit)
