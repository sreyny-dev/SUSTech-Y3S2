//public class sortWithIndex {
//    public static void main(String[] args) {
//        int[] A = {1, 9, 7, 5, 2, 4};
//        int[] indices = new int[A.length];
//        for (int i = 0; i < A.length; i++) {
//            indices[i] = i; // Start indices from 1
//        }
//
//        quickSortWithIndex(A, indices, 0, A.length - 1);
//
//        System.out.println("Sorted array:");
//        for (int num : A) {
//            System.out.print(num + " ");
//        }
//        System.out.println("\nIndices of original elements:");
//        for (int index : indices) {
//            System.out.print(index + " ");
//        }
//    }
//
//    public static void quickSortWithIndex(int[] arr, int[] indices, int low, int high) {
//        if (low < high) {
//            int pi = partition(arr, indices, low, high);
//
//            quickSortWithIndex(arr, indices, low, pi - 1);
//            quickSortWithIndex(arr, indices, pi + 1, high);
//        }
//    }
//
//    public static int partition(int[] arr, int[] indices, int low, int high) {
//        int pivot = arr[high];
//        int i = (low - 1);
//        for (int j = low; j < high; j++) {
//            if (arr[j] < pivot) {
//                i++;
//
//                // Swap arr[i] and arr[j]
//                int temp = arr[i];
//                arr[i] = arr[j];
//                arr[j] = temp;
//
//                // Swap indices[i] and indices[j]
//                temp = indices[i];
//                indices[i] = indices[j];
//                indices[j] = temp;
//            }
//        }
//
//        // Swap arr[i+1] and arr[high] (or pivot)
//        int temp = arr[i + 1];
//        arr[i + 1] = arr[high];
//        arr[high] = temp;
//
//        // Swap indices[i+1] and indices[high]
//        temp = indices[i + 1];
//        indices[i + 1] = indices[high];
//        indices[high] = temp;
//
//        return i + 1;
//    }
//}
// Java implementation of the approach
import java.util.Arrays;

public class examples {
    // Function to count the number of inversions
    // during the merge process
    private static int mergeAndCount(int[] arr, int l,
                                     int m, int r)
    {
        // Left subarray
        int[] left = Arrays.copyOfRange(arr, l, m + 1);

        // Right subarray
        int[] right = Arrays.copyOfRange(arr, m + 1, r + 1);


        int i = 0, j = 0, k = l, swaps = 0;

        while (i < left.length && j < right.length) {
            if (left[i] <= right[j])
                arr[k++] = left[i++];
            else {
                arr[k++] = right[j++];
                swaps += (m + 1) - (l + i);
            }
        }
        while (i < left.length)
            arr[k++] = left[i++];
        while (j < right.length)
            arr[k++] = right[j++];
        return swaps;
    }

    // Merge sort function
    private static int mergeSortAndCount(int[] arr, int l,
                                         int r)
    {

        // Keeps track of the inversion count at a
        // particular node of the recursion tree
        int count = 0;

        if (l < r) {
            int m = (l + r) / 2;

            // Total inversion count = left subarray count
            // + right subarray count + merge count

            // Left subarray count
            count += mergeSortAndCount(arr, l, m);

            // Right subarray count
            count += mergeSortAndCount(arr, m + 1, r);

            // Merge count
            count += mergeAndCount(arr, l, m, r);
        }

        return count;
    }

    // Driver code
    public static void main(String[] args)
    {
        int[] arr = { 1,2,0};

        System.out.println(mergeSortAndCount(arr, 0, arr.length - 1));
    }
}

// This code is contributed by Pradip Basak

