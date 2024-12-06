import java.util.*;

public class Test11B {

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int n = scanner.nextInt(); // number of projects
        int m = scanner.nextInt(); // number of prerequisites

        int[] P = new int[n];
        for (int i = 0; i < n; i++) {
            P[i] = scanner.nextInt(); // revenue of project i
        }

        List<List<Integer>> prerequisites = new ArrayList<>();
        for (int i = 0; i < m; i++) {
            int u = scanner.nextInt() - 1; // adjust index
            int v = scanner.nextInt() - 1; // adjust index
            prerequisites.add(Arrays.asList(u, v));
        }

        int result = findMaxRevenue(n, P, prerequisites);
        System.out.println(result); // print maximum revenue
    }

    public static int findMaxRevenue(int n, int[] P, List<List<Integer>> prerequisites) {
        // Create an array to store the maximum revenue for each project
        int[] maxRevenue = new int[n];

        // Initialize the maximum revenue for each project
        for (int i = 0; i < n; i++) {
            maxRevenue[i] = P[i];
        }

        // Iterate through the prerequisites to update the maximum revenue
        for (List<Integer> prerequisite : prerequisites) {
            int u = prerequisite.get(0);
            int v = prerequisite.get(1);
            maxRevenue[v] = Math.max(maxRevenue[v], maxRevenue[u] + P[v]);
        }

        // Find the maximum revenue among all projects
        int max = Integer.MIN_VALUE;
        for (int revenue : maxRevenue) {
            max = Math.max(max, revenue);
        }
        return max;
    }
}
