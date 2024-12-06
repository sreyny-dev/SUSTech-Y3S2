// Java program to count Fibonacci numbers in given range
import java.io.*;
import java.util.Scanner;

class CountFib {
    public static int countFibs(int low, int high)
    {
        int f1 = 1, f2 = 1, f3 = 2;
        int result = -1;

        while (f1 <= high) {
            if (f1 >= low) {
                result++;
            }
            f1 = f2;
            f2 = f3;
            f3 = f1 + f2;
        }
        return result;
    }
    public static void main(String[] args)
    {
        Scanner sc=new Scanner(System.in);
        int low=sc.nextInt();
        int high=sc.nextInt();
        System.out.println("Count of Fibonacci Numbers is "
                + countFibs(low, high));
    }
}

