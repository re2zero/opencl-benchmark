#include <stdio.h>
#include <time.h>
#include <sys/time.h>

typedef unsigned long long fuckin_large;

int main() {
  struct timeval s, e;
  gettimeofday(&s, 0);
  fuckin_large val = 0;
  for (fuckin_large j = 0; j < 1000000000; j++) {
    val += j;
  }

  gettimeofday(&e, 0);
  long long dur = (e.tv_usec + e.tv_sec * 1000000) - (s.tv_usec + s.tv_sec * 1000000);
  printf("Result: %llu in %'lu us\n", val, dur);
}
