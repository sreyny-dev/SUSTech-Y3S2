import java.util.Collections;
import java.util.LinkedList;
import java.util.List;
import java.util.StringTokenizer;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class Version1 {
    static class Edge {
        int source;
        int destination;
        int weight;

        public Edge(int source, int destination, int weight) {
            this.source = source;
            this.destination = destination;
            this.weight = weight;
        }
    }

    static class Graph {
        int vertices;
        LinkedList<Edge>[] adjacencylist;

        Graph(int vertices) {
            this.vertices = vertices + 1;
            adjacencylist = new LinkedList[this.vertices];
            // initialize adjacency lists for all the vertices
            for (int i = 1; i < this.vertices; i++) {
                adjacencylist[i] = new LinkedList<>();
            }
        }

        public void addEdge(int source, int destination, int weight) {
            Edge edge = new Edge(source, destination, weight);
            adjacencylist[source].addFirst(edge);
            edge = new Edge(destination, source, weight);
            adjacencylist[destination].addFirst(edge);
        }

        public int[] findFarthestNode(int startNode) {
            boolean[] visited = new boolean[vertices];
            int[] farthestInfo = {startNode, 0}; // {farthestNode, farthestDistance}
            dfsHelper(startNode, visited, 0, farthestInfo);
            return farthestInfo;
        }

        public void dfsHelper(int currentNode, boolean[] visited, int currentDistance, int[] farthestInfo) {
            visited[currentNode] = true;

            if (currentDistance > farthestInfo[1]) { // currentDistance > farthestDistance
                farthestInfo[0] = currentNode;
                farthestInfo[1] = currentDistance;
            }

            LinkedList<Edge> edges = adjacencylist[currentNode];

            for (Edge edge : edges) {
                int neighbor = edge.destination;
                int weight = edge.weight;

                if (!visited[neighbor]) {
                    dfsHelper(neighbor, visited, currentDistance + weight, farthestInfo);
                }
            }
        }

        public int[] findDiameter() {
            int[] farthest1 = findFarthestNode(1);
            int[] farthest2 = findFarthestNode(farthest1[0]);
            return new int[]{farthest1[0], farthest2[0], farthest2[1]};
        }

        public void printGraph() {
            for (int i = 1; i < vertices; i++) {
                for (Edge edge : adjacencylist[i]) {
                    if (i < edge.destination) {
                        System.out.println(i + " " + edge.destination + " " + edge.weight);
                    }
                }
            }
        }

        public void findNodesAlongDiameter(int startNode, int endNode, int currentWeight, LinkedList<Integer> path,
                                           LinkedList<Integer> weights, LinkedList<LinkedList<Integer>> paths,
                                           LinkedList<Integer> currentPath) {
            currentPath.add(startNode);
            currentWeight += getWeightBetween(startNode, endNode);

            if (startNode == endNode) {
                path.addAll(currentPath);
                weights.add(currentWeight);
                paths.add(new LinkedList<>(currentPath));
            } else {
                LinkedList<Edge> edges = adjacencylist[startNode];
                for (Edge edge : edges) {
                    int neighbor = edge.destination;
                    if (!currentPath.contains(neighbor)) {
                        findNodesAlongDiameter(neighbor, endNode, currentWeight, path, weights, paths, currentPath);
                    }
                }
            }

            currentPath.removeLast();
        }

        public void findAllPathsAlongDiameter(int farthestNode1, int farthestNode2,
                                              LinkedList<LinkedList<Integer>> allPaths) {
            LinkedList<Integer> path = new LinkedList<>();
            LinkedList<Integer> weights = new LinkedList<>();
            LinkedList<Integer> currentPath = new LinkedList<>();
            findNodesAlongDiameter(farthestNode1, farthestNode2, 0, path, weights, allPaths, currentPath);
        }

        private int getWeightBetween(int startNode, int endNode) {
            for (Edge edge : adjacencylist[startNode]) {
                if (edge.destination == endNode) {
                    return edge.weight;
                }
            }
            return 0;
        }

public int getAccumulatedDistances(int start, int end, int[] diameterPath) {
    int accumulatedDistance = 0;
    for (int i = start + 1; i <= end; i++) {
        int currentNode = diameterPath[i];
        int previousNode = diameterPath[i - 1];
        int edgeWeight = getWeightBetween(currentNode, previousNode);
            accumulatedDistance += edgeWeight;
            System.out.print(accumulatedDistance + " ");
    }
    return accumulatedDistance;
}


        public int findFarthestDistanceWithoutDiameter(int startNode, int[] diameterPath) {
            int maxDistance = 0;
            for (int node : diameterPath) {
                if (node == startNode) continue;

                int[] farthestInfo = {0, 0}; // {farthestNode, farthestDistance}
                dfsHelper(startNode, new boolean[vertices], 0, farthestInfo, diameterPath);

                if (farthestInfo[1] > maxDistance) {
                    maxDistance = farthestInfo[1];
                }
            }
            return maxDistance;
        }

        private void dfsHelper(int currentNode, boolean[] visited, int currentDistance, int[] farthestInfo,
                               int[] diameterPath) {
            visited[currentNode] = true;

            if (currentDistance > farthestInfo[1]) { // currentDistance > farthestDistance
                farthestInfo[0] = currentNode;
                farthestInfo[1] = currentDistance;
            }

            LinkedList<Edge> edges = adjacencylist[currentNode];

            for (Edge edge : edges) {
                int neighbor = edge.destination;
                int weight = edge.weight;

                if (!visited[neighbor] && !isOnDiameter(neighbor, diameterPath)) {
                    dfsHelper(neighbor, visited, currentDistance + weight, farthestInfo, diameterPath);
                }
            }
        }

        private boolean isOnDiameter(int node, int[] diameterPath) {
            for (int i = 0; i < diameterPath.length; i++) {
                if (diameterPath[i] == node) {
                    return true;
                }
            }
            return false;
        }
        public int findOptimalSubinterval(int s, int[] diameterPath) {
            int start = 0;
            int end = 0;
            int currentWeight = 0;
            int totalWeight = 0;

            for (int i = 0; i < diameterPath.length - 1; i++) {
                totalWeight += getWeightBetween(diameterPath[i], diameterPath[i + 1]);
            }
            int result = totalWeight;

            while (end < diameterPath.length - 1) {
                while (currentWeight <= s && end < diameterPath.length - 1) {
                    currentWeight += getWeightBetween(diameterPath[end], diameterPath[end + 1]);
                    end++;
                    if (currentWeight <= s) {
                        int a=0;
                        for(int j=0;j<start;j++){
                           a += getWeightBetween(diameterPath[j], diameterPath[j+1]);
                        }
                        int b = totalWeight - getAccumulatedDistances(0, end, diameterPath);
                        result = Math.min(result, Math.max(a, b));
                    }
                }
                while (currentWeight > s && start <= end) {
                    currentWeight -= getWeightBetween(diameterPath[start], diameterPath[start + 1]);
                    start++;
                    if (currentWeight <= s) {
                        int a=0;
                        for(int j=0;j<start;j++){
                            a += getWeightBetween(diameterPath[j], diameterPath[j+1]);
                        }
                        int b = totalWeight - getAccumulatedDistances(0, end, diameterPath);
                        result = Math.min(result, Math.max(a, b));
                    }
                }
            }
            return result;
        }
    }

    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        StringTokenizer st = new StringTokenizer(br.readLine());
        int n = Integer.parseInt(st.nextToken()); // number of nodes
        int s = Integer.parseInt(st.nextToken());
        Graph G = new Graph(n);
        for (int i = 1; i <= n - 1; i++) {
            st = new StringTokenizer(br.readLine());
            int a = Integer.parseInt(st.nextToken());
            int b = Integer.parseInt(st.nextToken());
            int w = Integer.parseInt(st.nextToken());
            G.addEdge(a, b, w);
        }

        int[] diameterInfo = G.findDiameter();
        int farthestNode1 = diameterInfo[0];
        int farthestNode2 = diameterInfo[1];

        // Finding all paths along the diameter
        LinkedList<LinkedList<Integer>> allPaths = new LinkedList<>();
        G.findAllPathsAlongDiameter(farthestNode1, farthestNode2, allPaths);

        // Finding the optimal subinterval on the diameter
        int[] diameterPath = allPaths.getFirst().stream().mapToInt(Integer::intValue).toArray();

        List<Integer> maxDistance = new LinkedList<>();
        int result = 0;
        for (int i = 0; i < diameterPath.length; i++) {
            int node = diameterPath[i];
            int farthestDistance = G.findFarthestDistanceWithoutDiameter(node, diameterPath);
            maxDistance.add(farthestDistance);
            result = Collections.max(maxDistance);
//            System.out.println("Farthest distance from Node " + node + " without passing through diameter nodes: " + farthestDistance);
        }
//        System.out.println(result);

        int accumulatedDistance = G.getAccumulatedDistances(0, diameterPath.length - 1, diameterPath);
//        System.out.println(accumulatedDistance);
        if(accumulatedDistance<=s){
            System.out.println(result);
        }else{
            int optimalSubinterval = G.findOptimalSubinterval(s, diameterPath);
            System.out.println(optimalSubinterval);
        }
    }
}
