
;; ----------------------------------------agenda
(require 'org)
(define-key global-map (kbd "C-c a") 'org-agenda)
;; 设置agenda路径
(setq org-agenda-files '("~/notes/todos/"))
;; ----------------------------------------priority & tags & state
;; 定义任务优先级,及标签分类
(setq org-agenda-custom-commands
      '(
        ("w" . "任务安排")
        ("wa" "重要且紧急的任务" tags-todo "+PRIORITY=\"A\"")
        ("wb" "重要且不紧急的任务" tags-todo "-weekly-monthly-daily+PRIORITY=\"B\"")
        ("wc" "不重要且紧急的任务" tags-todo "+PRIORITY=\"C\"")
        ("W" "Weekly Review"
	 ;; 尚未进行管理的任务
         ((stuck "") ;; review stuck projects as designated by org-stuck-projects
	  ;; 标签
          (tags-todo "project")
          (tags-todo "daily")
          (tags-todo "weekly")
          (tags-todo "school")
          (tags-todo "code")
          (tags-todo "theory")
          ))
        ))
;; 任务生命周期
(setq org-todo-keywords
      '(
	(sequence "TODO(t!)" "STARTED(s)" "|" "DONE(d!)" "CANCELED(c @/!)")
	))
;; ----------------------------------------capture
;; 绑定键位
(define-key global-map (kbd "C-c c") 'org-capture)

;; 这边就是为路径赋值
(defvar org-agenda-dir "" "gtd org files location")
(setq-default org-agenda-dir "~/notes/todos/")

(setq org-agenda-file-note (expand-file-name "notes.org" org-agenda-dir))
(setq org-agenda-file-task (expand-file-name "task.org" org-agenda-dir))
(setq org-agenda-file-calendar (expand-file-name "calendar.org" org-agenda-dir))
(setq org-agenda-file-finished (expand-file-name "finished.org" org-agenda-dir))
(setq org-agenda-file-canceled (expand-file-name "canceled.org" org-agenda-dir))

;; --------------------templates
(setq org-capture-templates
      '(
        ("t" "Todo" entry (file+headline org-agenda-file-task "Work")
         "* TODO [#B] %?\n  %i\n"
         :empty-lines 1)
        ("l" "Tolearn" entry (file+headline org-agenda-file-task "Learning")
         "* TODO [#B] %?\n  %i\n"
         :empty-lines 1)
        ("h" "Toplay" entry (file+headline org-agenda-file-task "Hobbies")
         "* TODO [#C] %?\n  %i\n"
         :empty-lines 1)
        ("o" "Todo_others" entry (file+headline org-agenda-file-task "Others")
         "* TODO [#C] %?\n  %i\n"
         :empty-lines 1)
        ("n" "notes" entry (file+headline org-agenda-file-note "Quick notes")
         "* %?\n  %i\n %U"
         :empty-lines 1)
        ("i" "ideas" entry (file+headline org-agenda-file-note "Quick ideas")
         "* %?\n  %i\n %U"
         :empty-lines 1)
        )
      )
;; --------------------refile
(define-key global-map (kbd "C-c r") 'org-refile)
(setq org-refile-targets '(
			   (org-agenda-file-note :maxlevel . 1)
			   (org-agenda-file-task :maxlevel . 1)
			   (org-agenda-file-calendar :maxlevel . 1)
			   (org-agenda-file-finished :maxlevel . 1)
			   (org-agenda-file-canceled :maxlevel . 1)
			   ))
;; ----------------------------------------番茄闹钟
(use-package org-pomodoro)


(defun org-file()
  (interactive)
  (find-file "~/.emacs.d/lisp/init-org.el"))
(provide 'init-org)
