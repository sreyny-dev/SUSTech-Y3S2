// StandardQuickSort.java
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.Arrays;
import java.util.Scanner;

public class StandardQuickSort {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int n = scanner.nextInt(); // Read the number of elements
        int[] nums = new int[n];
        for (int i = 0; i < n; i++) {
            nums[i] = scanner.nextInt(); // read each element
        }
        // Use Arrays.sort() as the standard quick sort implementation
        Arrays.sort(nums);

        // Output the sorted array to standard output
        System.out.println(Arrays.toString(nums));

    }
}