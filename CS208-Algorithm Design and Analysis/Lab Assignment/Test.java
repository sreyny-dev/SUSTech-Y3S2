public class Test {
    public static void main(String[] args) {
        int[] A = {1, 3, 5, 7};
        int[] B = {2, 4, 6, 8};
        int[] C = new int[2 * A.length];

        for(int i = 0; i < A.length; i++) {
            C[2*i] = A[i];
            C[2*i + 1] = B[i];
        }

        for(int i = 0; i < C.length; i++) {
            System.out.print(C[i] + " ");
        }
    }
}
