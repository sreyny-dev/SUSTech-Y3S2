import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.StringTokenizer;

public class MaxXORSum {
    public static void main(String[] args)  throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        StringTokenizer st = new StringTokenizer(br.readLine());
        int n = Integer.parseInt(st.nextToken());
        int k = Integer.parseInt(st.nextToken());
        long[] arr = new long[(int) (n)+1];
        st = new StringTokenizer(br.readLine());
        for (int i = 0; i < n; i++) {
            arr[i] = Long.parseLong(st.nextToken());
        }
        System.out.println(maxXORSum(arr, n, k));
    }
    public static long maxXORSum(long [] arr, int n, int k) {
        long [][] dp = new long[n + 1][k + 1];
        // Compute XOR prefix array
        long [] xorPrefix = new long [n + 1];
        for (int i = 1; i <= n; i++) {
            xorPrefix[i] = xorPrefix[i - 1] ^ arr[i - 1];
        }

        for (int j = 1; j <= k; j++) {
            for (int i = 1; i <= n; i++) {
                if (j == 1) {
                    dp[i][j] = xorPrefix[i];
                } else {
                    for (int x = j - 1; x < i; x++) {
                        dp[i][j] = Math.max(dp[i][j], dp[x][j - 1] + (xorPrefix[i] ^ xorPrefix[x]));
                    }
                }
            }
        }
        return dp[n][k];
    }
}

//import java.util.Scanner;
//
//public class MaxXORSum {
//    public static void main(String[] args) {
//        Scanner scanner = new Scanner(System.in);
//        int n = scanner.nextInt();
//        int k = scanner.nextInt();
//        int[] arr = new int[n + 1]; // Increase array size by 1 to start indexing from 1
//        for (int i = 0; i < n; i++) { // Start indexing from 1
//            arr[i] = scanner.nextInt();
//        }
//        System.out.println(maxXORSum(arr, n, k));
//    }
//
//    public static int maxXORSum(int[] arr, int n, int k) {
//        int[][] dp = new int[n + 1][k + 1];
//        // Compute XOR prefix array
//        int[] xorPrefix = new int[n + 1];
//        for (int i = 1; i <= n; i++) {
//            xorPrefix[i] = xorPrefix[i - 1] ^ arr[i - 1];
//        }
//
//        for (int j = 1; j <= k; j++) {
//            for (int i = 1; i <= n; i++) {
//                if (j == 1) {
//                    dp[i][j] = xorPrefix[i];
//                } else {
//                    for (int x = j - 1; x < i; x++) {
//                        dp[i][j] = Math.max(dp[i][j], dp[x][j - 1] + (xorPrefix[i] ^ xorPrefix[x]));
//                    }
//                }
//            }
//        }
//        return dp[n][k];
//    }
//}
