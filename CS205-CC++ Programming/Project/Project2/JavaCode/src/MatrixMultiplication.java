import java.util.*;

public class MatrixMultiplication{
public static void matrixMultiplication(float [] A, float []B, float[] C, int m, int n, int p){
    for(int i=0;i<m;i++){
        for(int j=0;j<p;j++){
            C[i*p+j]=0;
            for(int k=0;k<p;k++){
                C[i*p+j]+=A[i*n+k]*B[k*p+j];
            }
        }
    }
}
public static void print_result(float [] result, int m, int p){
    for(int i=0;i<m;i++){
        for(int j=0;j<p;j++){
            System.out.printf("%.2f ",result[i*p+j]);
        }
        System.out.println();
    }
}
public static void print_matrix(float []matrix, int size){
    for(int i=0;i<size;i++){
            System.out.printf("%.2f ",matrix[i]);
    }
    System.out.println();
}
    public static void main(String[] args) {
        Scanner sc=new Scanner(System.in);
        System.out.print("Enter rows for matrix A: ");
        int m=sc.nextInt();
        System.out.print("Enter columns for matrix A and Rows for matrix B: ");
        int n=sc.nextInt();
        System.out.print("Enter columns for matrix B: ");
        int p=sc.nextInt();
        float []A=new float[m*n];
        float []B=new float[n*p];
        float []C=new float[m*p];
        Random rand=new Random();
        //generate random matrix A and B
        System.out.println("Matrix A:");
        for(int i=0;i<m;i++){
            for(int j=0;j<n;j++){
                A[i*n+j]=rand.nextFloat()*10;
            }
//            print_matrix(A,n);
        }
        System.out.println("Matrix B: ");
        for(int i=0;i<n;i++){
            for(int j=0;j<p;j++){
                B[i*p+j]=rand.nextFloat()*10;
            }
//            print_matrix(B,p);
        }
        System.out.println("AxB: ");
        long startTime = System.nanoTime();
        matrixMultiplication(A,B,C,m,n,p);
        long endTime = System.nanoTime();
        long duration = (endTime - startTime);  // Time in nanoseconds

        // Convert nanoseconds to milliseconds
        double seconds = (double) duration / 1_000_000_000.0;
//        print_result(C,m,p);
        System.out.println("Execution time: " + seconds + " seconds");
    }
}