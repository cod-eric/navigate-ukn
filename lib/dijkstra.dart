import 'dart:collection';
import 'graph.dart';

class Dijkstra {
  List<(Node, bool)> visited_nodes = [];
  HashMap<Node, int> nodes_distance = HashMap<Node, int>();
  //List<Edge> graph;
  List<Edge> edges;
  List<Node> nodes;

  Dijkstra(this.nodes, this.edges);

  void setupDijkstra() {
    for (Node n in nodes){
      visited_nodes.add((n, false));
    }
  }


  void dijkstra(){
    for (int i = 0; i < graph.length; i++) {
      nodes_visited_status[] = false;
      visited_nodes.
    }
  }

  (Node, bool) getIndexOrNegOne(Node )
}