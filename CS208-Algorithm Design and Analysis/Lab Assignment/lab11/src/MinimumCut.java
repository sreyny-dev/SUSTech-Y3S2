//import java.io.BufferedReader;
//import java.io.IOException;
//import java.io.InputStreamReader;
//import java.util.*;
//
//public class MinimumCut {
//    public static class Edge {
//        int to, capacity;
//
//        Edge(int to, int capacity) {
//            this.to = to;
//            this.capacity = capacity;
//        }
//    }
//    public static boolean bfs(List<List<Edge>> rGraph, int s, int t, int[] parent) {
//        int n = rGraph.size();
//        boolean[] visited = new boolean[n];
//        Queue<Integer> queue = new LinkedList<>();
//        queue.add(s);
//        visited[s] = true;
//        Arrays.fill(parent, -1);
//        while (!queue.isEmpty()) {
//            int u = queue.poll();
//            for (Edge edge : rGraph.get(u)) {
//                int v = edge.to;
//                int capacity = edge.capacity;
//
//                if (!visited[v] && capacity > 0) {
//                    queue.add(v);
//                    parent[v] = u;
//                    visited[v] = true;
//                }
//            }
//        }
//        return visited[t];
//    }
//    public static long minimumCut(List<List<Edge>> graph, int s, int t) {
//        int n = graph.size();
//        List<List<Edge>> rGraph = new ArrayList<>();
//        for (int i = 0; i < n; i++) {
//            rGraph.add(new ArrayList<>(graph.get(i)));
//        }
//        int[] parent = new int[n];
//        long maxFlow = 0;
//
//        while (bfs(rGraph, s, t, parent)) {
//            int flowPath = Integer.MAX_VALUE;
//            for (int v = t; v != s; v = parent[v]) {
//                int u = parent[v];
//                for (Edge edge : rGraph.get(u)) {
//                    if (edge.to == v) {
//                        flowPath = Math.min(flowPath, edge.capacity);
//                        break;
//                    }
//                }
//            }
//            for (int v = t; v != s; v = parent[v]) {
//                int u = parent[v];
//                for (Edge edge : rGraph.get(u)) {
//                    if (edge.to == v) {
//                        edge.capacity -= flowPath;
//                        break;
//                    }
//                }
//                boolean found = false;
//                for (Edge edge : rGraph.get(v)) {
//                    if (edge.to == u) {
//                        edge.capacity += flowPath;
//                        found = true;
//                        break;
//                    }
//                }
//                if (!found) {
//                    rGraph.get(v).add(new Edge(u, flowPath));
//                }
//            }
//            maxFlow += flowPath;
//        }
//        return maxFlow;
//    }
//    public static void main(String[] args) throws IOException {
//        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
//        StringTokenizer st = new StringTokenizer(br.readLine());
//        int n = Integer.parseInt(st.nextToken());
//        int m = Integer.parseInt(st.nextToken());
//        List<List<Edge>> adj = new ArrayList<>();
//        for (int i = 0; i < n + 2; i++) {
//            adj.add(new ArrayList<>());
//        }
//        int sum = 0;
//        st = new StringTokenizer(br.readLine());
//        for (int i = 1; i <= n; i++) {
//            int price = Integer.parseInt(st.nextToken());
//            if (price >= 0) {
//                adj.get(0).add(new Edge(i, price));
//                sum += price;
//            } else {
//                adj.get(i).add(new Edge(n + 1, -price));
//            }
//        }
//        for (int i = 0; i < m; i++) {
//            st = new StringTokenizer(br.readLine());
//            int u = Integer.parseInt(st.nextToken());
//            int v = Integer.parseInt(st.nextToken());
//            adj.get(v).add(new Edge(u, Integer.MAX_VALUE));
//        }
//        long maxFlow = minimumCut(adj, 0, n + 1);
//        long maxRevenue=sum - maxFlow;
//        System.out.println(maxRevenue);
//    }
//}
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.*;

public class MinimumCut {
    public static class Edge {
        int destination, capacity;

        Edge(int destination, int capacity) {
            this.destination = destination;
            this.capacity = capacity;
        }
    }

    public static boolean bfs(LinkedList<LinkedList<Edge>> residualGraph, int source, int sink, int[] parent) {
        int nodeCount = residualGraph.size();
        boolean[] visited = new boolean[nodeCount];
        Queue<Integer> queue = new LinkedList<>();
        queue.add(source);
        visited[source] = true;
        Arrays.fill(parent, -1);

        while (!queue.isEmpty()) {
            int currentNode = queue.poll();

            for (Edge edge : residualGraph.get(currentNode)) {
                int neighbor = edge.destination;
                int remainingCapacity = edge.capacity;

                if (!visited[neighbor] && remainingCapacity > 0) {
                    queue.add(neighbor);
                    parent[neighbor] = currentNode;
                    visited[neighbor] = true;
                }
            }
        }

        return visited[sink];
    }

    public static long minimumCut(LinkedList<LinkedList<Edge>> graph, int source, int sink) {
        int nodeCount = graph.size();
        LinkedList<LinkedList<Edge>> residualGraph = new LinkedList<>();
        for (int i = 0; i < nodeCount; i++) {
            residualGraph.add(new LinkedList<>(graph.get(i)));
        }

        int[] parent = new int[nodeCount];
        long maxFlow = 0;

        while (bfs(residualGraph, source, sink, parent)) {
            int pathFlow = Integer.MAX_VALUE;
            for (int v = sink; v != source; v = parent[v]) {
                int u = parent[v];
                for (Edge edge : residualGraph.get(u)) {
                    if (edge.destination == v) {
                        pathFlow = Math.min(pathFlow, edge.capacity);
                        break;
                    }
                }
            }

            for (int v = sink; v != source; v = parent[v]) {
                int u = parent[v];
                for (Edge edge : residualGraph.get(u)) {
                    if (edge.destination == v) {
                        edge.capacity -= pathFlow;
                        break;
                    }
                }
                boolean found = false;
                for (Edge edge : residualGraph.get(v)) {
                    if (edge.destination == u) {
                        edge.capacity += pathFlow;
                        found = true;
                        break;
                    }
                }
                if (!found) {
                    residualGraph.get(v).add(new Edge(u, pathFlow));
                }
            }
            maxFlow += pathFlow;
        }

        return maxFlow;
    }

    public static void main(String[] args) throws IOException {
        BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
        StringTokenizer tokenizer = new StringTokenizer(reader.readLine());
        int nodeCount = Integer.parseInt(tokenizer.nextToken());
        int edgeCount = Integer.parseInt(tokenizer.nextToken());
        LinkedList<LinkedList<Edge>> graph = new LinkedList<>();
        for (int i = 0; i < nodeCount + 2; i++) {
            graph.add(new LinkedList<>());
        }

        int totalValue = 0;
        tokenizer = new StringTokenizer(reader.readLine());
        for (int i = 1; i <= nodeCount; i++) {
            int value = Integer.parseInt(tokenizer.nextToken());
            if (value >= 0) {
                graph.get(0).add(new Edge(i, value));
                totalValue += value;
            } else {
                graph.get(i).add(new Edge(nodeCount + 1, -value));
            }
        }

        for (int i = 0; i < edgeCount; i++) {
            tokenizer = new StringTokenizer(reader.readLine());
            int fromNode = Integer.parseInt(tokenizer.nextToken());
            int toNode = Integer.parseInt(tokenizer.nextToken());
            graph.get(toNode).add(new Edge(fromNode, Integer.MAX_VALUE));
        }

        long maxFlow = minimumCut(graph, 0, nodeCount + 1);
        long maxRevenue = totalValue - maxFlow;
        System.out.println(maxRevenue);
    }
}
