import 'dart:html';

import 'package:flutter/material.dart';
import 'package:navigate_ukn/roominputfield.dart';
import 'package:navigate_ukn/dijkstra.dart';
import 'dart:collection';
import 'dart:js_util';
import 'graph.dart';

void main() {
  /*runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: FormValidationExample(),
  ));*/


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

  print(dij.distanceNodes);
}

