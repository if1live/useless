main:
	make current;	\
	make dystopia

current: new_history_teaching.cpp
	rm -rf a.out
	clang++ $^ -W -Wall
	./a.out

dystopia: new_history_teaching.cpp
	rm -rf a.out
	clang++ $^ -W -Wall -DNEW_HISTORY_TEACHING
	./a.out

clean:
	rm -rf a.out *.o
