
(fset '<s
   (kmacro-lambda-form [?\C-a ?# ?+ ?B ?E ?I backspace ?G ?I ?N ?_ ?S ?R ?C return ?# ?+ ?E ?N ?D ?_ ?S ?R ?C ?\C-p ?\C-e ? ] 0 "%d"))
(fset 'sc
   (kmacro-lambda-form [?\C-x ?o ?\C-x ?b ?* ?s ?c ?h ?e ?m ?e ?* return ?\C-x ?o] 0 "%d"))
(fset 'init-scm
   (kmacro-lambda-form [?\( ?l ?o ?a ?d ?  ?\" ?~ ?/ ?l ?o ?c ?a ?l ?c ?o ?d ?e ?s ?/ ?s ?i ?c ?p ?/ ?i ?n ?i ?t ?. ?s ?c ?m ?\" ?\) ?x backspace ?\C-x ?\C-e] 0 "%d"))

;; macro
(define-key evil-normal-state-map (kbd "<SPC> mn") 'name-last-kbd-macro)
(define-key evil-normal-state-map (kbd "<SPC> mi") 'insert-kbd-macro)
(define-key evil-normal-state-map (kbd "<SPC> mo") 'open-kbd-macro-config)


(defun open-kbd-macro-config()
  (interactive)
  (find-file "~/.emacs.d/lisp/init-kbd-macros.el"))

(provide 'init-kbd-macros)
