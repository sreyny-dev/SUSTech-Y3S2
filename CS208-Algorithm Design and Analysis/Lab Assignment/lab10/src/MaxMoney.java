import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.StringTokenizer;

public class MaxMoney {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        StringTokenizer st = new StringTokenizer(br.readLine());
        int N = Integer.parseInt(st.nextToken());
        int M = Integer.parseInt(st.nextToken());
        int D = Integer.parseInt(st.nextToken());
        int[][] prices = new int[N + 1][M + 1];
        for (int i = 1; i <= N; i++) {
            st = new StringTokenizer(br.readLine());
            for(int j=1;j<=M;j++) {
                prices[i][j] = Integer.parseInt(st.nextToken());
            }
        }
        System.out.println(maxMoney(N, M, D, prices));

    }

    public static long maxMoney(int N, int M, int D, int[][] prices) {
        for (int day = 1; day < M; day++) {
            int[][] dp = new int[N + 1][D + 1];
            for (int item = 1; item <= N; item++) {
                for (int weight = 1; weight <= D; weight++) {
                    if (weight >= prices[item][day]) {
                        dp[item][weight] = Math.max(dp[item - 1][weight], (prices[item][day+1]-prices[item][day]) + dp[item][weight - prices[item][day]]);
                    } else {
                        dp[item][weight] = dp[item - 1][weight];
                    }
                }
            }
//            for (int i = 0; i < N + 1; i++) {
//                for (int j = 0; j < D + 1; j++) {
//                    System.out.print(dp[i][j] + " ");
//                }
//                System.out.println();
//            }
//            System.out.println();
            D += dp[N][D];

        }
        return D;
    }
}
