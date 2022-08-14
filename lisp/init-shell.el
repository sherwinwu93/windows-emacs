(use-package nodejs-repl)
(use-package exec-path-from-shell)
(define-key evil-normal-state-map (kbd "<SPC> '") 'shell)

(defun shell-file()
  (interactive)
  (find-file "~/.emacs.d/lisp/init-shell.el"))
(provide 'init-shell)
