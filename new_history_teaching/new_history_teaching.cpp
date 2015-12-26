/*
  Usage

  $ make current
  new_history_teaching.cpp:23:9: error: no viable overloaded operator[] for type 'const history_t' (aka 'const map<year_t, event_t>')
  history[1972] = "nothing";
  ...
  (compile error)

  $ make dystopia
  what happend in 1972 : nothing

 */
#include <map>
#include <string>
#include <cstdio>

#if NEW_HISTORY_TEACHING
#define const
#endif

typedef int year_t;
typedef std::string event_t;
typedef std::map<year_t, event_t> history_t;

const history_t create_original_history()
{
  history_t h;
  h[1972] = "유신";
  return h;
}

int main()
{
  const history_t history = create_original_history();
  history[1972] = "nothing";
  printf("what happend in 1972 : %s\n", history[1972].data());
  return 0;
}
