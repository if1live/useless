/*
오늘도 투표 놀이
맞는 말은 하나입니다. 그것을 골라주세요

두 번째 선택은 거짓입니다.
세 번째 선택은 참입니다.
네 번째 선택은 참입니다.
첫 번째 선택은 거짓입니다.

https://twitter.com/k2pa00/status/737300123332419585

## Execute
$ gprolog
['contradiction.pl'].
sol_a(A, B, C, D).
sol_b(A, B, C, D).
sol_c(A, B, C, D).
sol_d(A, B, C, D).
*/

/* true <-> false */
flip(true, false).
flip(false, true).

/* 1. 두 번째 선택은 거짓입니다. */
rule_a(A, B, _, _) :- A = true, B = false.
/* 2. 세 번째 선택은 참입니다. */
rule_b(_, B, C, _) :- B = true, C = true.
/* 3. 세 번째 선택은 참입니다. */
rule_c(_, _, C, D) :- C = true, D = true.
/* 4. 첫 번째 선택은 거짓입니다. */
rule_d(A, _, _, D) :- D = true, A = false.

inv_rule_a(A, B, _, _) :-
	rule_a(InvA, InvB, _, _),
	flip(InvA, A), flip(InvB, B).

inv_rule_b(_, B, C, _) :-
	rule_b(_, InvB, InvC, _),
	flip(InvB, B), flip(InvC, C).

inv_rule_c(_, _, C, D) :-
	rule_c(_, _, InvC, InvD),
	flip(InvC, C), flip(InvD, D).

inv_rule_d(A, _, _, D) :-
	rule_d(InvA, _, _, InvD),
	flip(InvA, A), flip(InvD, D).


sol_a(A, B, C, D) :-
	rule_a(A, B, C, D),
	inv_rule_b(A, B, C, D),
	inv_rule_c(A, B, C, D),
	inv_rule_d(A, B, C, D).

sol_b(A, B, C, D) :-
	inv_rule_a(A, B, C, D),
	rule_b(A, B, C, D),
	inv_rule_c(A, B, C, D),
	inv_rule_d(A, B, C, D).

sol_c(A, B, C, D) :-
	inv_rule_a(A, B, C, D),
	inv_rule_b(A, B, C, D),
	rule_c(A, B, C, D),
	inv_rule_d(A, B, C, D).

sol_d(A, B, C, D) :-
	inv_rule_a(A, B, C, D),
	inv_rule_b(A, B, C, D),
	inv_rule_c(A, B, C, D),
	rule_d(A, B, C, D).
