import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.StringTokenizer;

public class SquareProblem {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        StringTokenizer st = new StringTokenizer(br.readLine());
        int n = Integer.parseInt(st.nextToken());
        int m = Integer.parseInt(st.nextToken());
        int[][] matrix = new int[n + 1][m+1];
        for (int i = 1; i <= n; i++) {
            st = new StringTokenizer(br.readLine());
            for(int j = 1; j <= m; j++) {
                matrix[i][j] =Integer.parseInt(st.nextToken());
            }
        }
        System.out.println(maxSquare(n,m,matrix));
    }
    public static long maxSquare(int n, int m, int [][] matrix) {
        long [][] dp=new long[n+1][m+1];
        long maxLength=0;
        for(int i=1;i<=n;i++){
            for(int j=1;j<=m;j++){
                if(matrix[i][j]==1){
                    if(i==1 || j==1){
                        dp[i][j]=1;
                    }else{
                        dp[i][j]=1+Math.min(Math.min(dp[i][j-1], dp[i-1][j]), dp[i-1][j-1]);
                    }
                    maxLength=Math.max(maxLength,dp[i][j]);
                }
                }
            }
        return maxLength;
        }
    }
