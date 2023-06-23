enum NodeType { elevator, stairs, room, toilet, foodSpot, drinkSpot }

class Tuple<T, R> {
  Tuple(this.one, this.two);
  final T one;
  final R two;
}

class Graph {
  Graph(this.nodes, this.edges);

  final List<Node> nodes;
  final List<Edge> edges;
}

class Node {
  Node(this.id, this.name, this.building, this.floor, this.type,
      {this.allowDisabled = true});

  final int id;
  final String name;
  final String building;
  final int floor;
  final NodeType type;
  final bool allowDisabled;

  @override
  int get hashCode => id;

  @override
  bool operator ==(Object other) {
    return other is Node && id == other.id;
  }
}

class Edge {
  Edge(this.id, this.from, this.to, this.weight, {this.allowDisabled = true});

  final int id;
  final int weight;
  final Node from, to;
  final bool allowDisabled;
}
