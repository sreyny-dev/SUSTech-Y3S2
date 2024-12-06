import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Arrays;
import java.util.HashSet;
import java.util.StringTokenizer;

public class ModifiedArray {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        StringTokenizer st = new StringTokenizer(br.readLine());
        int n = Integer.parseInt(st.nextToken());
        int[] arr = new int[n + 1];
        st = new StringTokenizer(br.readLine());
        for (int i = 1; i <= n; i++) {
            arr[i] = Integer.parseInt(st.nextToken());
        }
        long[] result = modifiedArray(n, arr);
        System.out.println(result[0]);
        System.out.println(result[1]);
    }

    public static long[] modifiedArray(int n, int[] A) {
        long[] B = new long[n + 1];
        HashSet<Long> uniqueElements = new HashSet<>();
        for (int i = 1; i <= n; i++) {
            B[i] = (long) A[i] - i;
            uniqueElements.add(B[i]);
        }
        long[] C = new long[uniqueElements.size() + 1];
        Long[] tempArray = uniqueElements.toArray(new Long[0]);
        for (int i = 0; i < tempArray.length; i++) {
            C[i + 1] = tempArray[i];
        }
        Arrays.sort(C, 1, C.length);
        int m = C.length;
        long[][] dp = new long[n + 1][m];
        int[][] changes = new int[n + 1][m];
        for(int i=1;i<=n;i++){
            for(int j=0;j<m;j++) {
                changes[i][j] = Integer.MAX_VALUE;
                dp[i][j]=Integer.MAX_VALUE;
            }
        }
        int[] minPrevChange = new int[m];
        long[] minPrevDp = new long[m];
        for (int j = 1; j < m; j++) {
            dp[1][j] = Math.abs(B[1] - C[j]);
            changes[1][j] = (B[1] != C[j]) ? 1 : 0;
        }
        for (int i = 2; i <= n; i++) {
            minPrevDp[0] = Integer.MAX_VALUE;
            minPrevChange[0] = Integer.MAX_VALUE;
            for (int j = 1; j < m; j++) {
                minPrevChange[j] = minPrevChange[j - 1];
                minPrevDp[j] = minPrevDp[j - 1];
                if (minPrevChange[j]>changes[i - 1][j] ){
                    minPrevChange[j] = changes[i - 1][j];
                    minPrevDp[j] = dp[i - 1][j];
                }
                if (changes[i - 1][j] == minPrevChange[j]) {
                    minPrevDp[j] = Math.min(minPrevDp[j], dp[i - 1][j]);
                }
                if(B[i]!=C[j]){
                    changes[i][j] = minPrevChange[j] + 1;
                }else{
                    changes[i][j] = minPrevChange[j];
                }
                dp[i][j] = minPrevDp[j] + Math.abs(B[i] - C[j]);
            }
        }
        int minOperations = Integer.MAX_VALUE;
        long minSumDiff = Long.MAX_VALUE;
        for (int j = 1; j < m; j++) {
            if (minOperations>changes[n][j]) {
                minOperations = changes[n][j];
            }
        }
        for (int j = 1; j < m; j++) {
            if(minOperations==changes[n][j] ) {
                minSumDiff = Math.min(minSumDiff, dp[n][j]);
            } else if (minOperations>changes[n][j]) {
                minSumDiff = dp[n][j];
            }
        }
        return new long[]{minOperations, minSumDiff};
    }
}
