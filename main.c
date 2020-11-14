#include <stdio.h>

int problem1(int, int, int);
int problem2(int *array, int cnt);
int problem3(char *str);

int a2[] = {-2,-3,0};
char * a3 = "zzuohansh";
int main() 
{
  printf("%d\n", problem1(1, 2, -4));
  
  printf("%d\n", problem2(a2,3));

  printf("%d\n", problem3(a3)); 
  return 0;
}

// You are not allowed to use strstr. This defeats the function
// Do not remove.
char * strstr( char * str1, const char * str2 ) {return NULL;}



