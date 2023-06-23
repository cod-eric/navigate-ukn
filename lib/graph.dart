

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

  List<Node> search(String input) {
    List<Node> ret = [];
    String processedName = input.toLowerCase().replaceAll(RegExp(r'\s'), "");

    for (Node n in nodes) {
      if (n.name.contains(processedName) || n.processedNames.any((element) => element.contains(processedName)))
    }
    return ret;
  }
}

class Node {
  final int id;
  final String roomNr;
  final String name;
  final NodeType type;
  final bool allowDisabled;
  late  final List<String> searchKeywords;
  late  final List<String> processedNames;

  Node(this.id, this.roomNr, this.name, this.type,
      {this.allowDisabled = true, String keywords = ""})
      {    searchKeywords = keywords.split(';');
        processedNames = List.generate(searchKeywords.length,
                        (index) => searchKeywords[index].toLowerCase().
                        replaceAll(RegExp(r'\s'), ""));}
  factory fromJson(){
    return 
  }
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
