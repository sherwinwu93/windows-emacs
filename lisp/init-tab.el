(use-package awesome-tab
  :load-path "~/.emacs.d/lisp/awesome-tab"
  :config
  (awesome-tab-mode t))

;; tab隐藏
(defun awesome-tab-hide-tab (x)
  (let ((name (format "%s" x)))
    (or
     (string-prefix-p "*epc" name)
     (string-prefix-p "*helm" name)
     (string-prefix-p "*Help" name)
     (string-prefix-p "*Compile-Log*" name)
     (string-prefix-p "*lsp" name)
     (string-prefix-p "magit" name)
     )))

(defun awesome-tab-buffer-groups ()
  (list
   (cond
    ((or (string-equal "*" (substring (buffer-name) 0 1))
         (memq major-mode '(magit-process-mode
                            magit-status-mode
                            magit-diff-mode
                            magit-log-mode
                            magit-file-mode
                            magit-blob-mode
                            magit-blame-mode
			    dired-mode
                            )))
     "Emacs")
    ((derived-mode-p 'eshell-mode)
     "EShell")
    ((derived-mode-p 'emacs-lisp-mode)
     "Elisp")
    ;; ((derived-mode-p 'dired-mode)
    ;;  "Dired")
    ;; ((memq major-mode '(org-mode org-agenda-mode diary-mode))
    ;;  "OrgMode")
    (t
     (awesome-tab-get-group-name (current-buffer))))))



(provide 'init-tab)
