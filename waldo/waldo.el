;; 왈도체 구현체
;; 안녕하신가! 힘세고 강한 아침, 만일 내게 물어보면 나는 왈도.

;; execute & output
;; $ emacs --batch --script waldo.el
;; 안녕하신가!
;; 힘세고 강한 아침
;;
;; (나는 왈도)

(defun 안녕하신가! ()
  (message "안녕하신가!"))
(defun 힘세고 (a b)
  (let ((str-a (symbol-name a))
        (str-b (symbol-name b)))
    (message (concat "힘세고 " str-a " " str-b))))

(defun 물어보면 (x)
  (print x))

(defun 내게 (fn params)
  (funcall fn params))

(defun 만일 (x)
  (if t x))

(안녕하신가!)
(힘세고 '강한 '아침)
(만일 (내게 '물어보면 '(나는 왈도)))