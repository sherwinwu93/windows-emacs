(use-package magit
  :config
  :bind (("C-x g" . magit)))
(define-key global-map (kbd "<menu> g") 'magit)

(defun vc-file()
  (interactive)
  (find-file "~/.emacs.d/lisp/init-vc.el"))

(provide 'init-vc)
