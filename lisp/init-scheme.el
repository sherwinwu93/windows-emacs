(require 'xscheme)
(setq scheme-program-name "/usr/local/bin/mit-scheme --stack 10000")
(defun open-mit-scheme()
  (interactive)
  (execute-kbd-macro (kbd "C-X 2"))
  (execute-kbd-macro (kbd "C-X o"))
  (run-scheme "scheme --heap 512")
  (execute-kbd-macro (kbd "C-X o"))
)
(global-set-key (kbd "<f6>") 'open-mit-scheme)
(defun move-end-$-exec-it()
  (interactive)
  (execute-kbd-macro (kbd "C-e"))
  (execute-kbd-macro (kbd "C-x C-e"))
)
(global-set-key (kbd "<f5>") 'move-end-$-exec-it)






(provide 'init-scheme)
