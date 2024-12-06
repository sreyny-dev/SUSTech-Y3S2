#include <stdio.h>
#include <math.h>

long double basicCalculation(long double a, long double b, char op) {
    long double result = 0L;
    if (op == '+')
        result = a + b;
    else if (op == '-')
        result = a - b;
    else if (op == '*')
        result = a * b;
    else if (op == '/') {
        if (b == 0) {
            printf("A number cannot be divied by zero.\n");
        }
        result = a / b;
    }
    return result;
}

long double powerSquare( long double a) {
    return a * a;
}

long double cubePower( long double a) {
    return a * a * a;
}

long double nthPower( long double a,  long double b) {
    long double result = 1L;
    for (int i = 1; i <= b; i++) {
        result *= a;
    }
    return result;
}

long double nthRoot( long double a, int b) {
    return pow(a, 1.0 / b);
}

long double calculateSin( long double a) {
    double radian = a * 3.14159 / 180;
    return sin(radian);
}

long double calculateCos( long double a) {
    long double radian = a * 3.14159 / 180;
    return cos(radian);
}

int main() {
    int option;
    char op;
    printf("Enter:\n");
    printf("1: basic calculation (+ - * /)\n");
    printf("2: power square of x^2\n");
    printf("3: cubic number x^3\n");
    printf("4: nth power x^y\n");
    printf("5: square root of x\n");
    printf("6: nth root of x\n");
    printf("7: Sin of x degree\n");
    printf("8: Cos of x degree\n");
    printf("---------------------------------------\n");
    
    while (1) {
        printf("Enter option (or -1 to exit): ");
        scanf("%d", &option);

        if (option == -1) {
            break; // end the loop
        }

         long double a, b, result = 0;
        if (option == 1) {
            printf("Enter first number, operator, second number: \n");
             if (scanf("%Lf %c %Lf", &a, &op, &b) != 3) {
                printf("The input cannot be interpreted as numbers!.\n");
                while (getchar() != '\n');
                continue;
            }
            result = basicCalculation(a, b, op);
            if ((int)result == result) {
                printf("%.0Lf %c %.0Lf = %.0Lf\n", a, op, b, result);
            }else if (a>1.0e20 || b>1.0e20){
            printf("%.1Le %c %.1Le = %.1Le\n", a, op, b, result);
            }
            else{
                printf("%.4Lf %c %.4Lf=%.4Lf\n", a,op,b,result);
            }
            } else if (option == 2) {
            printf("Enter the value of x: ");
            if (scanf("%Lf", &a) != 1) {
                printf("The input cannot be interpreted as numbers!.\n");
                while (getchar() != '\n');
                continue;
            }
            result = powerSquare(a);
            if ((int)result == result) {
                printf("Result=%.0Lf\n", result);
            } else {
                printf("Result=%.8Lf\n", result);
            }
        } else if (option == 3) {
            printf("Enter the value of x: ");
            if (scanf("%Lf", &a) != 1) {
                printf("The input cannot be interpreted as numbers!.\n");
                while (getchar() != '\n');
                continue;
            }
            result = cubePower(a);
            if ((int)result == result) {
                printf("Result=%.0Lf\n", result);
            } else {
                printf("Result=%.8Lf\n", result);
            }
        } else if (option == 4) {
            printf("Enter the value of x: ");
            if (scanf("%Lf", &a) != 1) {
                printf("The input cannot be interpreted as numbers!.\n");
                while (getchar() != '\n');
                continue;
            }
            printf("Enter the value of y: ");
            if (scanf("%Lf", &b) != 1) {
                printf("The input cannot be interpreted as numbers!.\n");
                while (getchar() != '\n');
                continue;
            }
            result = nthPower(a, b);
            if ((int)result == result) {
                printf("Result=%.0Lf\n", result);
            } else {
                printf("Result=%.8Lf\n", result);
            }
        } else if (option == 5) {
            printf("Enter the value of x: ");
            if (scanf("%Lf", &a) != 1) {
                printf("The input cannot be interpreted as numbers!.\n");
                while (getchar() != '\n');
                continue;
            }
            result = sqrt(a);
            if ((int)result == result) {
                printf("Result=%.0Lf\n", result);
            } else {
                printf("Result=%.8Lf\n", result);
            }
        } else if (option == 6) {
            printf("Enter the value of x: ");
            if (scanf("%Lf", &a) != 1) {
                printf("The input cannot be interpreted as numbers!.\n");
                while (getchar() != '\n');
                continue;
            }
            printf("Enter exponent: ");
            scanf("%Lf", &b);
            if (b <= 0 || b != (int)b) {
                printf("Warning: Exponent must be a positive integer.\n");
                continue;
            }
            result = nthRoot(a, (int)b);
            if ((int)result == result) {
                printf("Result=%.0Lf\n", result);
            } else {
                printf("Result=%.8Lf\n", result);
            }
        } else if (option == 7) {
            printf("Enter the value of x in degree: ");
           if (scanf("%Lf", &a) != 1) {
                printf("The input cannot be interpreted as numbers!.\n");
                while (getchar() != '\n');
                continue;
            }
            result = calculateSin(a);
            if ((int)result == result) {
                printf("Result=%.0Lf\n", result);
            } else {
                printf("Result=%.8Lf\n", result);
            }
        }
        else if (option == 8) {
            printf("Enter the value of x in degree: ");
            if (scanf("%Lf", &a) != 1) {
                printf("The input cannot be interpreted as numbers!.\n");
                while (getchar() != '\n');
                continue;
            }
            result = calculateCos(a);
            if ((int)result == result) {
                printf("Result=%.0Lf\n", result);
            } else {
                printf("Result=%.8Lf\n", result);
            }
        }
        else {
            printf("Invalid option\n");
        }
    }
    return 0;
}
