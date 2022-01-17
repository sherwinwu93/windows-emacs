;; 设置dired-mode只有一个buffer
(put 'dired-find-alternate-file 'disabled nil)
(with-eval-after-load 'dired
  (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file))
;; C-x C-j进入当前目录
(require 'dired-x)



(provide 'init-dired)
