import 'package:dijkstra/dijkstra.dart';

import 'graph.dart';

///Find shortest path between two nodes.
class DijkstraWalk {
  late List<Edge> edges;
  late List<Node> nodes;
  late int nodesCnt;
  late Map<int, Map<int, int>> graph;
  late Map<int, Node> nodeHashMap;

  ///Initializes DijkstraWalk.
  ///
  /// [nods] the list of all `Node`s in the graph.
  /// [edgs] the list of all `Edge`s in the graph.
  DijkstraWalk(List<Node> nods, List<Edge> edgs) {
    nodes = nods;
    edges = edgs;
    nodesCnt = nods.length;
    _buildDijkstra();
  }

  /// Builds the dijkstra graph for dijkstra.dart.
  void _buildDijkstra() {
    graph = {};
    nodeHashMap = {};

    for (Node n in nodes) {
      graph[n.id] = {};
      nodeHashMap[n.id] = n;
    }

    for (Edge e in edges) {
      graph[e.from.id]![e.to.id] = e.weight;
      graph[e.to.id]![e.from.id] = e.weight;
    }
  }

  /// Finds the shortest path between [src] and [dst], if exists.
  ///
  /// [src] The source `Node`
  /// [dst] The destination `Node`
  /// [returns] A list of `Node`s in the path order to get from [src] to [dst]. Returns an empty List if no path exists.
  List<Node> dijkstra(Node src, Node dst) {
    List dijPath = Dijkstra.findPathFromGraph(graph, src.id, dst.id);

    List<Node> nodePath = [];
    for (int i in dijPath) {
      nodePath.add(nodeHashMap[i]!);
      Node lastEl = nodePath[nodePath.length - 1];
    }
    return nodePath;
  }
}
