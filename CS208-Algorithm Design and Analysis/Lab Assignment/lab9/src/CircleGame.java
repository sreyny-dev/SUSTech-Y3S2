import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.StringTokenizer;

public class CircleGame {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        StringTokenizer st = new StringTokenizer(br.readLine());
        long testCase = Long.parseLong(st.nextToken());
        for (int i = 0; i < testCase; i++) {
            st = new StringTokenizer(br.readLine());
            long n = Long.parseLong(st.nextToken());
            long m = Long.parseLong(st.nextToken());
            System.out.println(numOfWays(n,m));
        }
    }
    static long M = 1000000007L;
    public static long numOfWays(long n, long m) {
        long[] array = new long[(int) n];
        array[0] = 1;
        for (int i = 0; i < m; i++) {
            long[] temp = new long[(int) n];
            for (int j = 0; j < n; j++) {
                temp[(int) ((j - 1 + n) % n)] = (temp[(int) ((j - 1 + n) % n)] + array[j]) % M;
                temp[(int) ((j + 1) % n)] = (temp[(int) ((j + 1) % n)] + array[j]) % M;
            }
            for (int k = 0; k < n; k++) {
                array[k] = temp[k];
            }
        }
        return array[0];
    }
}

