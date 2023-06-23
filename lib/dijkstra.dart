import 'dart:collection';
import 'dart:js_util';
import 'graph.dart';

class Dijkstra {
  int INT_MAX_VALUE = 999999;
  late List<Edge> edges;
  late List<Node> nodes;
  late int nodesCnt;

  late Set<Node> visitedNodes;
  late HashMap<Node, int> distanceNodes;

  //List<(Node, Node, int)> graph = [];

  Dijkstra(List<Node> nods, List<Edge> edgs) {
    nodes = nods;
    edges = edgs;
    nodesCnt = nods.length;
    visitedNodes = {};
    distanceNodes = HashMap();
  }

  void dijkstra(Node src, Node dst) {
    /*
    def dijkstra(self, source):
    dist = [float('inf')] * self.V
    seen = set()
    heap = []
    dist[source] = 0

    heapq.heappush(heap, (source, dist[source]))

    while len(heap) > 0:
        node, weight = heapq.heappop(heap)
        seen.add(weight)

        for conn, w in self.graph[node]:
            if conn not in seen:
                d = weight + w
                if d < dist[conn]:
                    dist[conn] = d
                    heapq.heappush(heap, (conn, d))
     */

    /*
    def slow_dijkstra(self,source):
    dist = [float('inf')] * self.V
    seen = set()
    dist[source] = 0

    for _ in range(self.V):
        u = self.minDistance(dist, seen)
        seen.add(u)

        for node, weight in self.graph[u]:
            if node not in seen and dist[node] > dist[u] + weight:
                dist[node] = dist[u] + weight
     */

    //SETUP distance_nodes, visited_nodes, heap, dist[src] = 0
    visitedNodes = {};
    distanceNodes = HashMap<Node, int>();
    distanceNodes[src] = 0;
    List<Node> path = [src];

    //SETUP DISTANCE ARRAY
    for (int i = 0; i < nodesCnt; i++) {
      distanceNodes[nodes[i]] = INT_MAX_VALUE;
    }

    //IMPLEMENTATION
    for (int i = 0; i < nodesCnt; i++) {
      Node u = minDistance();
      print("node with min distance: ${u.id}");
      visitedNodes.add(u);

      for (Edge e in edges) {
        if (equal(e.from, u)) {
          if (!visitedNodes.contains(e.to) &&
              distanceNodes[e.to]! > distanceNodes[e.from]! + e.weight) {
            distanceNodes[e.to] = distanceNodes[e.from]! + e.weight;
          }
        } else if (equal(e.to, u)) {
          if (!visitedNodes.contains(e.from) &&
              distanceNodes[e.from]! > distanceNodes[e.to]! + e.weight) {
            distanceNodes[e.from] = distanceNodes[e.to]! + e.weight;
          }
        }
      }
    }
  }

  Node minDistance() {
    /*
    def minDistance(self, dist, seen):
    min_d = float('inf')

    for v in range(self.V):
        if v not in seen and dist[v] < min_d:
            min_d = dist[v]
            min_vertex = v
    return min_vertex
     */

    int min_w = INT_MAX_VALUE;
    Node min_v = Node(-1, "", "", -1, NodeType.toilet);

    for (Node n in nodes) {
      if (!visitedNodes.contains(n) && distanceNodes[n]! < min_w) {
        min_w = distanceNodes[n]!;
        min_v = n;
      }
    }
    if (equal(min_v, null)){
      throw Exception("min_v must not be null");
    }
    return min_v;
  }

  void main(){
    List<Node> nodees = [
      Node(1, "1.1.1", "1", 1, NodeType.toilet),
      Node(2, "1.1.2", "1", 1, NodeType.toilet),
      Node(3, "1.1.3", "1", 1, NodeType.toilet),
      Node(4, "1.1.4", "1", 1, NodeType.toilet),
      Node(0, "1.1.5", "1", 1, NodeType.stairs)
    ];
    List<Edge> edgees = [
      Edge(1, nodees[4], nodees[0], 2),
      Edge(2, nodees[0], nodees[3], 9),
      Edge(3, nodees[0], nodees[2], 1),
      Edge(4, nodees[1], nodees[2], 3),
      Edge(5, nodees[1], nodees[3], 4)
    ];
    Dijkstra dij = Dijkstra(nodees, edgees);
    dij.dijkstra(nodees[0], nodees[3]);
    
    print(distanceNodes);
  }

}
