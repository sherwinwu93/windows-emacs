;; ----------------------------------------配置插件源
(require 'package)
(package-initialize)
(setq package-archives '(("gnu" . "https://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
	                 ("melpa" . "https://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")
	                 ("org" . "https://mirrors.tuna.tsinghua.edu.cn/elpa/org/")))
;; 如果 use-package 没安装
(unless (package-installed-p 'use-package)
	;; 更新本地缓存
	(package-refresh-contents)
	;; 之后安装它。use-package 应该是你配置中唯一一个需要这样安装的包。
	(package-install 'use-package))
;; 让 use-package 永远按需安装软件包
(setq use-package-always-ensure t)



(provide 'init-packages)
