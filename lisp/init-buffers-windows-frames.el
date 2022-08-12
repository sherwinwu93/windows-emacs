;; (define-key evil-normal-state-map (kbd "") ')
;; files
(define-key evil-normal-state-map (kbd "<SPC> d") 'dired)
(define-key evil-normal-state-map (kbd "<SPC> f") 'find-file)
(define-key evil-normal-state-map (kbd "<SPC> s") 'save-buffer)
(define-key evil-normal-state-map (kbd "<SPC> r") 'recentf-open-files)

;; buffers
(define-key evil-normal-state-map (kbd "<SPC> bb") 'ivy-switch-buffer)
(define-key evil-normal-state-map (kbd "<SPC> bl") 'list-buffers)

;; windows
(define-key evil-normal-state-map (kbd "<SPC> o") 'other-window)
(define-key evil-normal-state-map (kbd "<SPC> 0") 'select-window-0)
(define-key evil-normal-state-map (kbd "<SPC> 1") 'select-window-1)
(define-key evil-normal-state-map (kbd "<SPC> 2") 'select-window-2)
(define-key evil-normal-state-map (kbd "<SPC> 3") 'select-window-3)
(define-key evil-normal-state-map (kbd "<SPC> 4") 'select-window-4)
(define-key evil-normal-state-map (kbd "<SPC> -") 'shrink-window)
(define-key evil-normal-state-map (kbd "<SPC> =") 'enlarge-window)
(define-key evil-normal-state-map (kbd "<SPC> [") 'shrink-window-horizontally)
(define-key evil-normal-state-map (kbd "<SPC> ]") 'enlarge-window-horizontally)
(define-key evil-normal-state-map (kbd "<SPC> w0") 'delete-window)
(define-key evil-normal-state-map (kbd "<SPC> w1") 'delete-other-windows)
(define-key evil-normal-state-map (kbd "<SPC> w2") 'split-window-below)
(define-key evil-normal-state-map (kbd "<SPC> w3") 'split-window-right)



(provide 'init-buffers-windows-frames)
