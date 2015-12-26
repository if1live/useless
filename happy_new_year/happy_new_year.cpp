#include <cstdio>
#include <memory>

class Year {
public:
  ~Year() {
    printf("Happy New Year!\n");
  }
};

#define Happy
#define CODE_BEGIN std::auto_ptr<Year> ptr(
#define CODE_END ); return 0;

int main() {
  CODE_BEGIN
  Happy new Year
  CODE_END
}