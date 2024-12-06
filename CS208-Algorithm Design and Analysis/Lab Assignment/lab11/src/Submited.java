import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.*;

public class Submited {

    public static class Edge {
        int destination, capacity;

        Edge(int destination, int capacity) {
            this.destination = destination;
            this.capacity = capacity;
        }
    }

    public static void main(String[] args) throws IOException {
        Submited minimumCut = new Submited();
        minimumCut.run();
    }

    private void run() throws IOException {
        BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
        StringTokenizer tokenizer = new StringTokenizer(reader.readLine());
        int nodeCount = Integer.parseInt(tokenizer.nextToken());
        int edgeCount = Integer.parseInt(tokenizer.nextToken());

        LinkedList<LinkedList<Edge>> graph = createGraph(nodeCount);
        int totalValue = initializeGraph(reader, nodeCount, graph);

        addEdges(reader, edgeCount, graph);

        long maxFlow = calculateMinimumCut(graph, 0, nodeCount + 1);
        long maxRevenue = totalValue - maxFlow;
        System.out.println(maxRevenue);
    }

    private LinkedList<LinkedList<Edge>> createGraph(int nodeCount) {
        LinkedList<LinkedList<Edge>> graph = new LinkedList<>();
        for (int i = 0; i < nodeCount + 2; i++) {
            graph.add(new LinkedList<>());
        }
        return graph;
    }

    private int initializeGraph(BufferedReader reader, int nodeCount, LinkedList<LinkedList<Edge>> graph) throws IOException {
        StringTokenizer tokenizer = new StringTokenizer(reader.readLine());
        int totalValue = 0;
        for (int i = 1; i <= nodeCount; i++) {
            int value = Integer.parseInt(tokenizer.nextToken());
            if (value >= 0) {
                graph.get(0).add(new Edge(i, value));
                totalValue += value;
            } else {
                graph.get(i).add(new Edge(nodeCount + 1, -value));
            }
        }
        return totalValue;
    }

    private void addEdges(BufferedReader reader, int edgeCount, LinkedList<LinkedList<Edge>> graph) throws IOException {
        for (int i = 0; i < edgeCount; i++) {
            StringTokenizer tokenizer = new StringTokenizer(reader.readLine());
            int fromNode = Integer.parseInt(tokenizer.nextToken());
            int toNode = Integer.parseInt(tokenizer.nextToken());
            graph.get(toNode).add(new Edge(fromNode, Integer.MAX_VALUE));
        }
    }

    private boolean dfs(LinkedList<LinkedList<Edge>> residualGraph, int source, int sink, int[] parent) {
        int nodeCount = residualGraph.size();
        boolean[] visited = new boolean[nodeCount];
        Stack<Integer> stack = new Stack<>();
        stack.push(source);
        visited[source] = true;
        Arrays.fill(parent, -1);

        while (!stack.isEmpty()) {
            int currentNode = stack.pop();
            for (Edge edge : residualGraph.get(currentNode)) {
                int neighbor = edge.destination;
                int remainingCapacity = edge.capacity;
                if (!visited[neighbor] && remainingCapacity > 0) {
                    stack.push(neighbor);
                    parent[neighbor] = currentNode;
                    visited[neighbor] = true;
                    if (neighbor == sink) {
                        return true;
                    }
                }
            }
        }
        return visited[sink];
    }

    private long calculateMinimumCut(LinkedList<LinkedList<Edge>> graph, int source, int sink) {
        int nodeCount = graph.size();
        LinkedList<LinkedList<Edge>> residualGraph = new LinkedList<>();
        for (int i = 0; i < nodeCount; i++) {
            residualGraph.add(new LinkedList<>(graph.get(i)));
        }

        int[] parent = new int[nodeCount];
        long maxFlow = 0;

        while (dfs(residualGraph, source, sink, parent)) {
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
}
