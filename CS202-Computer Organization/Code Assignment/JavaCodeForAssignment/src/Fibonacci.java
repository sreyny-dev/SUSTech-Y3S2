public class Fibonacci {
    public static void main(String[] args) {
//        Scanner sc=new Scanner();
        int n = 10; // Number of Fibonacci numbers to generate
        System.out.println("Fibonacci Series up to " + n + " terms:");
        for (int i = 0; i < n; i++) {
            System.out.print(fibonacci(i) + " ");
        }
    }

    public static int fibonacci(int n) {
        if (n <= 1) {
            return n;
        } else {
            return fibonacci(n - 1) + fibonacci(n - 2);
        }
    }
}
