(jde-project-file-version "1.0")
(jde-set-variables
 ;; 配置jdk
 '(jde-jdk-registry (quote (("1.6" . "/usr/java/jdk1.7.0_51"))))
 '(jde-jdk (quote ("1.6")))
 ;; 每次编译后更新交叉引用
 '(jde-ant-build-hook (quote (jde-compile-finish-kill-buffer jde-compile-finish-refresh-speedbar jde-compile-finish-update-class-info my-jde-compile-finish-update-xref)))
 '(jde-compile-finish-hook (quote (jde-compile-finish-kill-buffer jde-compile-finish-refresh-speedbar jde-compile-finish-update-class-info my-jde-compile-finish-update-xref)))
 ;; 交叉引用配置
 '(jde-xref-db-base-directory "./xrefdb")
 '(jde-xref-store-prefixes (quote ("")))
 '(jde-xref-cache-size 10)
 ;; 使用ant作为build命令(build.xml放在项目根目录下就可以，通过下面的配置可以让JDEE自己找)
 '(jde-build-function (quote jde-ant-build))
 '(jde-ant-read-target t)
 '(jde-ant-enable-find t)
 ;; 配置源文件与class文件路径
 '(jde-sourcepath (quote ("./src")))
 '(jde-built-class-path (quote ("./bin")))
 '(jde-global-classpath (quote ("./bin" "./src" "./lib")))
 ;; 编辑模式配置
 '(jde-electric-return-p t)
 '(jde-enable-abbrev-mode t))
