/*
  http://en.wikipedia.org/wiki/C_Sharp_syntax#Closure_blocks

  C#
  public void Foo()
  {
    using (var bar = File.Open("Foo.txt"))
    {
      // do some work
      throw new Exception();
      // bar will still get properly disposed.
    }
  }

  Python
  with open("x.txt") as f:
    data = f.read()
 */
#include <cstdio>

class Foo {
public:
	Foo() { printf("construct\n"); }
	~Foo() { printf("destructor\n"); }
	void call() { printf("call\n"); }
};

#define WITH_COND_VAR(LINE) __with_run_##LINE
#define WITH_FOR(EXPR, LINE) \
	int WITH_COND_VAR(LINE) = false; \
	for(EXPR ; WITH_COND_VAR(LINE) == false ; WITH_COND_VAR(LINE) = true)
#define WITH(EXPR) WITH_FOR(EXPR, __LINE__)


int main()
{
	// legacy
	printf("legacy block\n");
	{
		Foo foo;
		foo.call();
	}

	// closure-block
	printf("closure block - 1\n");
	WITH(Foo foo) {
		foo.call();
	}

	printf("closure block - 2\n");
	WITH(Foo foo) {
		foo.call();
	}

	return 0;
}
