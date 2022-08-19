(use-package magit
  :config
  :bind (("s-g" . magit)))

(defun vc-file()
  (interactive)
  (find-file "~/.emacs.d/lisp/init-vc.el"))

(provide 'init-vc)
