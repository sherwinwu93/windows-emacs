(use-package magit
  :config
  (define-key global-map (kbd "<menu> g") 'magit)
  :bind (("C-x g" . magit)))

(defun vc-file()
  (interactive)
  (find-file "~/.emacs.d/lisp/init-vc.el"))

(provide 'init-vc)
