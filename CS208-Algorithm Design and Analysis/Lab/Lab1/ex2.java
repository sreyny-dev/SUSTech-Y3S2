import java.util.Scanner;
public class ex2 {
    public static int countTilingWays(int n) {
    if (n <= 2) {
        return n;
      }
      return countTilingWays(n - 1) + countTilingWays(n - 2);
    }
    
    public static void main(String[] args) {
        Scanner sc=new Scanner(System.in);
        int n = sc.nextInt();
        sc.close();
        int ways = countTilingWays(n);
        System.out.println("Number of ways to tile a 2*n rectangle: " + ways);
    }
}