;; Inspired by https://twitter.com/mcwannabee/status/700853924010438656
;; 움베르토 에코의 에세이 가운데 '말줄임표의 사용법'이란 글을 인상적으로 읽었다.
;; 말줄임표(...)는 자신의 표현에 책임을 지지 않으려는 아마추어적 소심함이라는 게 요지다.
;; 실제 SNS 포스트를 잘 관찰하면 대단히 정확한 통찰이라는 걸 깨달을 수 있다.

;; Usage: clisp ellipsis.lisp

;; How to it works?
;; REAL function name : "<zero width space>..."
(defun ​... () (princ "..."))
(​...)
