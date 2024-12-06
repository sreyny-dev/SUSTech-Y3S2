import javax.swing.*;
import java.io.*;
import java.util.*;

public class Test {
    public static void main(String[] args) throws IOException {
        // Initialize BufferedReader and BufferedWriter for input and output
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(System.out));

        // Read the number of elements
        int n = Integer.parseInt(br.readLine());
        int[] A = new int[n + 1];
        long[] B = new long[n + 1];
        HashSet<Long> hashSet = new HashSet<>();

        // Read the array elements and populate arrays A and B, and the hashSet
        String[] input = br.readLine().split(" ");
        for (int i = 1; i <= n; i++) {
            A[i] = Integer.parseInt(input[i - 1]);
            B[i] = A[i] - i;
            hashSet.add(B[i]);
        }

        // Create and populate the sortedB array from the hashSet
        int i = 1;
        long[] sortedB = new long[hashSet.size() + 1];
        for (long val : hashSet)
            sortedB[i++] = val;
        Arrays.sort(sortedB, 1, sortedB.length);

        // Initialize the opNum and diffSum arrays with default values
        int[][] opNum = new int[n + 1][sortedB.length];
        long[][] diffSum = new long[n + 1][sortedB.length];
        for (i = 1; i <= n; i++) {
            Arrays.fill(opNum[i], Integer.MAX_VALUE);
            Arrays.fill(diffSum[i], Long.MAX_VALUE);
        }

        // Memoization arrays for operation number and difference sum
        int[] memoOpNum = new int[sortedB.length];
        long[] memoDiffSum = new long[sortedB.length];

        // Main logic to populate opNum and diffSum
        for (i = 1; i <= n; i++) {
            memoOpNum[0] = Integer.MAX_VALUE;
            memoDiffSum[0] = Long.MAX_VALUE;
            for (int j = 1; j < sortedB.length; j++) {
                memoOpNum[j] = memoOpNum[j - 1];
                memoDiffSum[j] = memoDiffSum[j - 1];
                if (opNum[i - 1][j] < memoOpNum[j]) {
                    memoOpNum[j] = opNum[i - 1][j];
                    memoDiffSum[j] = diffSum[i - 1][j];
                } else if (opNum[i - 1][j] == memoOpNum[j]) {
                    memoDiffSum[j] = Math.min(memoDiffSum[j], diffSum[i - 1][j]);
                }

                int inc = (B[i] != sortedB[j]) ? 1 : 0;
                long diff = Math.abs(B[i] - sortedB[j]);
                opNum[i][j] = memoOpNum[j] + inc;
                diffSum[i][j] = memoDiffSum[j] + diff;
            }
        }

        // Determine the minimum operation number and minimum difference sum
        int minOpNum = Integer.MAX_VALUE;
        long minDiffSum = Long.MAX_VALUE;
        for (int j = 1; j < sortedB.length; j++) {
            if (opNum[n][j] < minOpNum) {
                minOpNum = opNum[n][j];
                minDiffSum = diffSum[n][j];
            } else if (opNum[n][j] == minOpNum) {
                minDiffSum = Math.min(minDiffSum, diffSum[n][j]);
            }
        }

        // Output the results
        bw.write(minOpNum + "\n" + minDiffSum);

        // Flush and close BufferedWriter and BufferedReader
        bw.flush();
        bw.close();
        br.close();
    }
}

