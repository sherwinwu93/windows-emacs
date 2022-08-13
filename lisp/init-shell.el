(use-package nodejs-repl)
(use-package exec-path-from-shell)
(define-key evil-normal-state-map (kbd "<SPC> '") 'shell)


(provide 'init-shell)
