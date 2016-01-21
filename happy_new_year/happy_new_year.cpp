#include <memory>
#define f1 "Happy New %d Year!"
#define f2 "Wait %d Year"
#define nl "\n"
#define Happy int main(){std::unique_ptr<M>ptr(
#define year M());return 0;}

struct M{~M(){
time_t t=time(0);struct tm *n=localtime(&t);
int y=n->tm_year+0x76c;int m=n->tm_mon;int d=n->tm_mday;
if((m==11&&d==037)||(m==0&&d==1))printf(f1 nl,y+(m%10));
else printf(f2 nl,y+1);}};


Happy new year
