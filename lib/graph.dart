import 'konstanz_csv.dart';

enum NodeType { elevator, stairs, room, hallway, toilet, foodSpot, drinkSpot }

Graph uniKonstanz = Graph.fromString(konstanzNodes, konstanzEdges);

class Tuple<T, R> {
  Tuple(this.one, this.two);

  final T one;
  final R two;
}

class Graph {
  Graph(this.nodes, this.edges);

  late final List<Node> nodes;
  late final List<Edge> edges;

  Graph.fromString(String nodeData, String edgeData) {
    nodes = nodeData
        .trim()
        .split("\n")
        .skip(1) // skip header
        .where((e) => e.isNotEmpty)
        .map((e) => Node.fromCSV(e.split(separator)))
        .toList();
    edges = edgeData
        .trim()
        .split("\n")
        .skip(1) // skip header
        .map((e) => Edge.fromCSV(e.split(separator), nodes))
        .toList();
  }

  List<Node> search(String input) {
    List<Node> ret = [];
    String processedName = input.toLowerCase().replaceAll(RegExp(r'\s'), "");

    for (Node n in nodes) {
      if (n.processedName.contains(processedName) ||
          n.processedNames.any((element) => element.contains(processedName))) {
        ret.add(n);
      }
    }
    return ret;
  }
}

class Node {
  static int nextId = 0;
  late final int id;
  late final String name;
  late final int floor;
  late final NodeType type;
  late final bool allowDisabled;
  late final List<String> searchKeywords;
  late final List<String> processedNames;
  late final String processedName;
  late final double x;
  late final double y;

  Node.fromCSV(List<String> data) {
    id = nextId++;
    name = data[0];
    floor = int.parse(data[1]);
    type = NodeType.values.byName(data[2]);
    allowDisabled = bool.parse(data[3], caseSensitive: false);
    x = int.parse(data[4]);
    y = int.parse(data[5]);
    searchKeywords = data.sublist(6);
    processedName = name.toLowerCase().replaceAll(RegExp(r'\s'), "");
    processedNames = List.generate(
        searchKeywords.length,
        (index) =>
            searchKeywords[index].toLowerCase().replaceAll(RegExp(r'\s'), ""));
  }

  @override
  int get hashCode => id;

  @override
  bool operator ==(Object other) {
    return other is Node && id == other.id;
  }

  @override
  String toString() {
    return "$name, $processedNames";
  }
}

class Edge {
  Edge(this.from, this.to, this.weight, {this.allowDisabled = true});

  late final int weight;
  late final Node from, to;
  late final bool allowDisabled;

  Edge.fromCSV(List<String> data, List<Node> nodes) {
    from = nodes[int.parse(data[0])];
    to = nodes[int.parse(data[1])];
    weight = int.parse(data[2]);
    if (data.length >= 3) {
      allowDisabled = bool.parse(data[3], caseSensitive: false);
    }
  }
}
