// Java program to print largest contiguous array sum
import java.io.*;
import java.util.*;

class example {
    // Driver Code
    public static void main(String[] args)
    {
        int[] a = {0, -1, -2, 3, -2, 4, 5 };
        System.out.println("Maximum contiguous sum is " + maxSubArraySum(a));
    }

    // Function Call
    static int maxSubArraySum(int a[])
    {
        int size = a.length;
        int max_so_far = Integer.MIN_VALUE, max_ending_here
                = 0;

        for (int i = 1; i <= 6; i++) {
            max_ending_here = max_ending_here + a[i];
            if (max_so_far < max_ending_here)
                max_so_far = max_ending_here;
            if (max_ending_here < 0)
                max_ending_here = 0;
        }
        return max_so_far;
    }
}