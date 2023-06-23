import 'dart:js_util';
import 'graph.dart';
import 'package:dijkstra/dijkstra.dart';

class DijkstraWalk {
  late List<Edge> edges;
  late List<Node> nodes;
  late int nodesCnt;
  late Map<int, Map<int, int>> graph;
  late Map<int, Node> nodeHashMap;

  DijkstraWalk(List<Node> nods, List<Edge> edgs) {
    nodes = nods;
    edges = edgs;
    nodesCnt = nods.length;
  }

  void buildDijkstra() {
    graph = {};
    nodeHashMap = {};

    for (Node n in nodes){
      graph[n.id] = {};
      nodeHashMap[n.id] = n;
    }

    for (Edge e in edges){
      graph[e.from.id]![e.to.id] = e.weight;
      graph[e.to.id]![e.from.id] = e.weight;
    }
  }

  List<Node> dijkstra(Node src, Node dst){
    List dijPath = Dijkstra.findPathFromGraph(graph, src.id, dst.id);

    List<Node> nodePath = [];
    for (int i in dijPath){
      nodePath.add(nodeHashMap[i]!);
      Node lastEl = nodePath[nodePath.length - 1];
    }
    return nodePath;
  }

}
