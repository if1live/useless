;; Implementation "살자! == !자살", "자살! == !살자"
;; How to run
;; emacs --script suicide.el

(defun fun-string-msg (word &optional func)
  (if (eq nil func)
      ;; no argument
      word
    ;; argument
    word))
(defun 자살 (&optional func) (fun-string-msg "자살" func))
(defun 살자 (&optional func) (fun-string-msg "살자" func))

(defun ! (x)
  (cond ((eq "자살" (funcall x)) "살자")
        ((eq "살자" (funcall x)) "자살")
        ("unknown")))

;;(print (eq (! #'자살) (살자 #'!)))
;;(print (eq (! #'살자) (자살 #'!)))

(defun eval-life (l)
  (let ((first-elem (car l))
        (second-elem (cadr l)))
    (funcall first-elem second-elem)))

(print (eq (eval-life `(! 자살))
           (eval-life `(살자 !))))

(print (eq (eval-life `(! 살자))
           (eval-life `(자살 !))))
