
#include "myMath.h"
#define exp 2.71828

double Pow(double base, int power)
    {
      if(power < 0){
        return -1;
      }
        double result = 1;
        while (power)
        {
            if (power & 1)
                result *= base;
            power >>= 1;
            base *= base;
        }

        return result;
    }

//double Exp(int x){
//    return Pow(exp,x);
//}
double Exp(int x){
    double base= exp ;
     if(x < 0){
        return -1;
      }
        double result = 1;
        while (x)
        {
            if (x & 1)
                result *= base;
            x >>= 1;
            base *= base;
        }

        return result;
    }
