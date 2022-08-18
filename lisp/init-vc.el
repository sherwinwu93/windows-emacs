(use-package magit
  :config
  :bind (("C-x g" . magit)))
(define-key global-map (kbd "s-g") 'magit)

(defun vc-file()
  (interactive)
  (find-file "~/.emacs.d/lisp/init-vc.el"))

(provide 'init-vc)
