#include <stdio.h>
#include <signal.h>
#include <unistd.h>

static int prev_fib = 0;
static int curr_fib = 1;

void sig_handler(int signo)
{
  if (signo == SIGINT) {
    sigset(SIGINT, SIG_IGN);
    main();
  }
}
  
int main(void)
{
  printf("fib: %d\n", curr_fib);
  int next_fib = curr_fib + prev_fib;
  prev_fib = curr_fib;
  curr_fib = next_fib;
  
  if (signal(SIGINT, sig_handler) == SIG_ERR) {
    printf("\ncan't catch SIGINT\n");
  }
  
  printf("ctrl-c to calculate next fibonacci\n");
  // A long long wait so that we can easily issue a signal to this process
  while(1)
    sleep(1);
  return 0;
}