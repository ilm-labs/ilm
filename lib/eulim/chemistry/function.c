#include<stdio.h>​
void CanNeverExecute(){​
   printf("I can be executed only by kamlesh");​
}​
void GetInput(){​
  char buffer[8]; ​
  gets(buffer);​
  puts(buffer);​
}​
​
int main(){​

  GetInput();​
​
​  return 0;
}​