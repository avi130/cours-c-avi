#include <stdio.h>
#include "myMath.h"

int main() {
    double x;
    printf("please enter real number for x\n");
    scanf("%lf", &x);


   
double f1,f2,f3;
f1 = add(Exp(x),Pow(x,3));
f1 = sub(f1,2);

printf("the value of f(x)=e^x+x^3-2  at the point %0.4f is: %0.4f\n" ,x, f1  );
 
f2 = add(mul(Pow(x,2),2),mul(x,3));
printf("the value of f(x)=3x+2x^2  at the point %0.4f is: %0.4f\n" ,x, f2  );
 
f3 = sub( div(mul(Pow(x,3),4),5),mul(x,2));
printf("the value of f(x)=(4x^3)/5-2x  at the point %0.4f is: %0.4f\n" ,x , f3 );
 return 0;
}