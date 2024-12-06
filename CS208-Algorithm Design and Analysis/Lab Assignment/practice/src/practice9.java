public class practice9 {
    public static int minPenalty(int[] t, int[] d, int[] w) {
        int n = t.length;
        int D = 0;
        for (int deadline : d) {
            D = Math.max(D, deadline);
        }
        int[][] dp = new int[n + 1][D + 1];

        for (int i = 1; i <= n; i++) {
            for (int j = 1; j <= D; j++) {
                if (t[i - 1] > j) {
                    dp[i][j] = dp[i - 1][j];
                } else {
                    dp[i][j] = Math.min(dp[i - 1][j], dp[i - 1][Math.min(j, d[i - 1])] + w[i - 1]);
                }
            }
        }
        return dp[n][D];
    }
    public static void main(String[] args) {
        int[] t = {2, 1, 3, 8, 1}; // Time needed to finish tasks
        int[] d = {4, 1, 3, 8, 4}; // Deadlines
        int[] w = {10, 5, 15, 7, 0}; // Penalties

        int minPenalty = minPenalty(t, d, w);
        System.out.println("Minimum Penalty: " + minPenalty);
    }
}
