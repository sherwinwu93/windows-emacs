(use-package magit
  :config
  (define-key evil-normal-state-map (kbd "<SPC> g") 'write-abbrev-file)
  :bind (("C-x g" . magit)))

(provide 'init-vc)
