;; rime输入法
(require 'posframe)
;; 让 use-package 永远按需安装软件包
(setq use-package-always-ensure t)

;; 之后就可以使用它了。
;; 要使用简体中文，记得修改defualt.yml
(use-package rime
  :custom
  (default-input-method "rime")
 :bind
  (:map rime-active-mode-map
   ("<tab>" . 'rime-inline-ascii)
   :map rime-mode-map
   ("C-`" . 'rime-send-keybinding)    ;; <----
   ("M-j" . 'rime-force-enable))
)
(setq rime-show-candidate 'posframe)

(provide 'init-input)
