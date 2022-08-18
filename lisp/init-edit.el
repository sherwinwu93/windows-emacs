
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
(define-key global-map (kbd "s-b") 'bookmark-set$save)
(define-key global-map (kbd "s-l") 'list-bookmarks)
(defun bookmarks-file()
  (interactive)
  (find-file "~/.emacs.d/bookmarks"))

(defun edit-file()
  (interactive)
  (find-file "~/.emacs.d/lisp/init-edit.el"))
(provide 'init-edit)
