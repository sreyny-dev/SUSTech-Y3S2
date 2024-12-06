public class Main {
    public static void main(String[] args) {
        multiplication();
    }
    public static void printMultiplication(int a, int b){
        int c = a * b;
        System.out.println(a + " * " + b + " = " + c);
    }

    public static void multiplication() {
        for (int i = 1; i <= 9; i++) {
            for (int j = 1; j <= 9; j++) {
                printMultiplication(i,j);
            }
            System.out.println();
        }
    }
}
