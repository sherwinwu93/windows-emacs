(use-package magit
  :bind (("C-x g" . magit)))
(define-key evil-normal-state-map (kbd "<SPC> g") 'write-abbrev-file)

(provide 'init-vc)
