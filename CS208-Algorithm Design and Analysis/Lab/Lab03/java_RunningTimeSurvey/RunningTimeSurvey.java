import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Random;
import java.io.File;
import java.lang.reflect.Method;
import jxl.Workbook;
import jxl.write.Label;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;
public class RunningTimeSurvey {
    //             task name            function name             run times upper
    static String[][] taskList = {
            {  "LinearTimeTest",        "linearTime",             "10000000"},
            {  "LinearTimeTest",        "linearTimeCollections",  "10000000"},
            { "NlognTimeTest",       "NlognTime",              "10000000"},
            { "QuadraticTimeTest",   "QuadraticTime",          "100000"},
            { "CubicTimeTest",       "CubicTime",              "1000"},
            { "ExponentialTimeTest", "ExponentialTime",        "29"},
            { "FactorialTimeTest",   "FactorialTime",          "10"}

    };
    public static void main(String[] args) {
        // TODO Auto-generated method stub
        String osName = System.getProperty("os.name");
        System.out.println(osName);
        try {
            File xlsFile = new File("RunningTimeSurvey.xls");
            // Create a workbook
            WritableWorkbook workbook = Workbook.createWorkbook(xlsFile);
            // Create a worksheet
            WritableSheet sheet = workbook.createSheet("RunningTime", 0);
            // the first row
            int max_upper=0,max_giant_upper=0;
            for(String[]taskInfo:taskList)
            {
                max_upper=Math.max(max_upper,Integer.parseInt(taskInfo[2]));
                if (taskInfo[0].equals("ExponentialTimeTest") || taskInfo[0].equals("FactorialTimeTest")) {
                    max_giant_upper=Math.max(max_giant_upper,Integer.parseInt(taskInfo[2]));
                }
            }
            for (int j = 1, n = 10; n <= max_upper; j++,n*=10) {
                sheet.addCell(new Label(j + 1, 0, "n = " + n));
            }
            int next_row=1;
            for (int i = 0; i < taskList.length; i++) {
                String[] taskInfo = taskList[i];
                if (taskInfo[0].equals("ExponentialTimeTest") || taskInfo[0].equals("FactorialTimeTest")) {
                    continue;
                }
                Class<?> me = Class.forName(Thread.currentThread().getStackTrace()[1].getClassName());
                Method method = me.getMethod(taskInfo[1], int.class);
                int upper = Integer.parseInt(taskInfo[2]);
                sheet.addCell(new Label(0, i + 1, taskInfo[0]));
                sheet.addCell(new Label(1, i + 1, taskInfo[1]));
                next_row=i+1;
                for (int j = 1, n = 1; Math.pow(10, j) <= upper; j++) {
                    n = 10 * n;
                    Long time = (Long) method.invoke(null, n);
                    // add data to sheet
                    sheet.addCell(new Label(j + 1, i + 1, time.toString()));
                }
            }
            ++next_row;
            for (int j = 1, n = 10; n <= max_giant_upper; j++,++n) {
                sheet.addCell(new Label(j + 1, next_row, "n = " + n));
            }
            ++next_row;
            for(String[]taskInfo:taskList)
            {
                if (!(taskInfo[0].equals("ExponentialTimeTest") || taskInfo[0].equals("FactorialTimeTest"))) {
                    continue;
                }
                Class<?> me = Class.forName(Thread.currentThread().getStackTrace()[1].getClassName());
                Method method = me.getMethod(taskInfo[1], int.class);
                int upper = Integer.parseInt(taskInfo[2]);
                sheet.addCell(new Label(0, next_row, taskInfo[0]));
                sheet.addCell(new Label(1, next_row, taskInfo[1]));
                for (int j = 1, n = 10; n <= upper; j++) {
                    ++n;
                    Long time = (Long) method.invoke(null, n);
                    // add data to sheet
                    sheet.addCell(new Label(j + 1, next_row, time.toString()));
                }
                ++next_row;
            }
            workbook.write();
            workbook.close();
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }
    public static long linearTimeCollections(int n) {
        ArrayList<Long> arrayList = new ArrayList<Long>(n);
        generateArrayList(n, arrayList);
        long timeStart = System.currentTimeMillis();
        getMax(n, arrayList);
        long timeEnd = System.currentTimeMillis();
        long timeCost = timeEnd - timeStart;
        return timeCost;
    }
    public static long linearTime(int n) {
        long[] list = new long[n];
        generateList(n, list);
        long timeStart = System.currentTimeMillis();
        getMax(n, list);
        long timeEnd = System.currentTimeMillis();
        long timeCost = timeEnd - timeStart;
        return timeCost;
    }
    public static long getMax(long n, long[] list) {
        long max = list[0];
        for (int i = 1; i < n; i++) {
            if (list[i] > max) {
                max = list[i];
            }
        }
        return max;
    }
    public static void generateList(int n, long[] list) {
        for (int i = 0; i < n; i++) {
            list[i] = i;
        }
        // shuffle
        Random rnd = new Random();
        for (int i = list.length; i > 1; i--) {
            int j = rnd.nextInt(i);
            long temp = list[j];
            list[j] = list[i - 1];
            list[i - 1] = temp;
        }
    }
    public static void generateArrayList(int n, ArrayList<Long> arrayList) {
        for (long i = 0; i < n; i++) {
            arrayList.add(i);
        }
        // shuffle
        Collections.shuffle(arrayList);
    }
    public static long getMax(long n, ArrayList<Long> arrayList) {
        long max = arrayList.get(0);
        for (int i = 1; i < n; i++) {
            if (arrayList.get(i) > max) {
                max = arrayList.get(i);
            }
        }
        return max;
    }
    public static long NlognTime(int n) {
        int[] list = new int[n];
        generateArray(n, list);
        long timeStart = System.currentTimeMillis();
        HeapSort ob = new HeapSort();
        ob.sort(list);
        long timeEnd = System.currentTimeMillis();
        long timeCost = timeEnd - timeStart;
        return timeCost;
    }

    public static long QuadraticTime(int n) {
        int[] list = new int[n];
        generateArray(n, list);
        long timeStart = System.currentTimeMillis();
        BubbleSort(list);
        long timeEnd = System.currentTimeMillis();
        long timeCost = timeEnd - timeStart;
        return timeCost;
    }
    public static long CubicTime(int n) {
        int rows = n;
        int cols = n;
        int[][] matrix1 = new int[rows][cols];
        int[][] matrix2 = new int[rows][cols];
        generateMatrix(rows, cols, matrix1);
        generateMatrix(rows, cols, matrix2);
        long timeStart = System.currentTimeMillis();
        int[][] result = multiplyMatrices(matrix1, matrix2);
        long timeEnd = System.currentTimeMillis();
        long timeCost = timeEnd - timeStart;
        return timeCost;
    }
    public static long ExponentialTime(int n) {
        long timeStart = System.currentTimeMillis();
        fibonacci(n);
        long timeEnd = System.currentTimeMillis();
        long timeCost = timeEnd - timeStart;
        return timeCost;
    }
    public static long FactorialTime(int n) {
        int [] input=generateInputData(n);
        long timeStart = System.currentTimeMillis();
        generatePermutations(input);
        long timeEnd = System.currentTimeMillis();
        long timeCost = timeEnd - timeStart;
        return timeCost;
    }
    public static int[] generateInputData(int n) {
        int[] input = new int[n];
        for (int i = 0; i < n; i++) {
            input[i] = i + 1;
        }
        return input;
    }
    public static void generatePermutations(int[] nums) {
        List<List<Integer>> permutations = new ArrayList<>();
        backtrack(nums, new ArrayList<>(), permutations);
    }
    private static void backtrack(int[] nums, List<Integer> currentPermutation, List<List<Integer>> permutations) {
        if (currentPermutation.size() == nums.length) {
            permutations.add(new ArrayList<>(currentPermutation));
        } else {
            for (int i = 0; i < nums.length; i++) {
                if (currentPermutation.contains(nums[i])) {
                    continue;
                }
                currentPermutation.add(nums[i]);
                backtrack(nums, currentPermutation, permutations);
                currentPermutation.remove(currentPermutation.size() - 1);
            }
        }
    }
    public static void generateArray(int n, int[] list) {
        for (int i = 0; i < n; i++) {
            list[i] = i;
        }
        // shuffle
        Random rnd = new Random();
        for (int i = list.length; i > 1; i--) {
            int j = rnd.nextInt(i);
            int temp = list[j];
            list[j] = list[i - 1];
            list[i - 1] = temp;
        }
    }
    public static void generateMatrix(int rows, int cols, int[][] matrix) {
        int totalElements = rows * cols;
        int[] list = new int[totalElements];

        // Generate the array
        for (int i = 0; i < totalElements; i++) {
            list[i] = i;
        }

        // Shuffle the array
        Random rnd = new Random();
        for (int i = totalElements; i > 1; i--) {
            int j = rnd.nextInt(i);
            int temp = list[j];
            list[j] = list[i - 1];
            list[i - 1] = temp;
        }

        // Convert the shuffled array into a 2D matrix
        int index = 0;
        for (int i = 0; i < rows; i++) {
            for (int j = 0; j < cols; j++) {
                matrix[i][j] = list[index++];
            }
        }
    }
    public static class HeapSort {
        public void sort(int arr[]) {
            int N = arr.length;

            // Build heap (rearrange array)
            for (int i = N / 2 - 1; i >= 0; i--)
                heapify(arr, N, i);

            // One by one extract an element from heap
            for (int i = N - 1; i > 0; i--) {
                // Move current root to end
                int temp = arr[0];
                arr[0] = arr[i];
                arr[i] = temp;

                // call max heapify on the reduced heap
                heapify(arr, i, 0);
            }
        }

        // To heapify a subtree rooted with node i which is
        // an index in arr[]. n is size of heap
        void heapify(int arr[], int N, int i) {
            int largest = i; // Initialize largest as root
            int l = 2 * i + 1; // left = 2*i + 1
            int r = 2 * i + 2; // right = 2*i + 2

            // If left child is larger than root
            if (l < N && arr[l] > arr[largest])
                largest = l;

            // If right child is larger than largest so far
            if (r < N && arr[r] > arr[largest])
                largest = r;

            // If largest is not root
            if (largest != i) {
                int swap = arr[i];
                arr[i] = arr[largest];
                arr[largest] = swap;
                heapify(arr, N, largest);
            }
        }
    }
    public static void BubbleSort(int array[]){
        for(int i=0; i<array.length-1;i++){
            for(int j=0; j<array.length-i-1;j++){
                if(array[j]>array[j+1]){
                    int temp = array[j];
                    array[j]=array[j+1];
                    array[j+1]=temp;
                }
            }
        }
    }
    public static int[][] multiplyMatrices(int[][] matrix1, int[][] matrix2) {
        int rows1 = matrix1.length;
        int cols1 = matrix1[0].length;
        int rows2 = matrix2.length;
        int cols2 = matrix2[0].length;

        if (cols1 != rows2) {
            throw new IllegalArgumentException("Matrix dimensions are not compatible for multiplication");
        }

        int[][] result = new int[rows1][cols2];

        for (int i = 0; i < rows1; i++) {
            for (int j = 0; j < cols2; j++) {
                for (int k = 0; k < cols1; k++) {
                    result[i][j] += matrix1[i][k] * matrix2[k][j];
                }
            }
        }

        return result;
    }
    public static int fibonacci(int n) {
        if (n <= 1) {
            return n;
        }

        return fibonacci(n - 1) + fibonacci(n - 2);
    }
}