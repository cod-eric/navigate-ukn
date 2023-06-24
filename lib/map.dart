import 'dart:html';

import 'package:flutter/material.dart';
import 'graph.dart';
import 'dijkstra.dart';

class NavPage extends StatefulWidget {
  final Node from, to;
  const NavPage(this.from, this.to, {super.key});

  @override
  State<NavPage> createState() => _NavPageState(from, to);
}

class _NavPageState extends State<NavPage> {
  late int floor;
  late List<Node> path;
  _NavPageState(Node from, Node to) {
    floor = from.floor;
    path =
        DijkstraWalk(uniKonstanz.nodes, uniKonstanz.edges).dijkstra(from, to);
    print("Dijkstra:");
    path.forEach(print);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Navigation"),
      ),
      body: Column(
        children: [
          Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                "Floor $floor",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.left,
              )),
          Center(
            child: Stack(children: [
              Image.asset(
                'assets/floorplans/$floor.png',
                fit: BoxFit.contain,
              ),
              CustomPaint(
                  painter: LinePainter(
                      path.where((e) => e.floor == floor).toList(),
                      MediaQuery.of(context).size.width / 20,
                      MediaQuery.of(context).size.height / 20,
                      widget.from,
                      widget.to)),
            ]),
          ),
          DropdownButton(
              hint: const Text("Floor"),
              items: createItems(widget.from.floor, widget.to.floor),
              onChanged: (value) => setState(() {
                    floor = value;
                  }))
        ],
      ),
    );
  }

  List<DropdownMenuItem> createItems(int from, int to) {
    List<DropdownMenuItem> l = [];
    for (int i = from; i <= to; i++) {
      l.add(DropdownMenuItem(
        child: Text("Floor: $i"),
      ));
    }
    return l;
  }
}

class LinePainter extends CustomPainter {
  final List<Node> path;
  final double xScale, yScale;
  final Node from, to;
  LinePainter(this.path, this.xScale, this.yScale, this.from, this.to);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.red // Customize the line color here
      ..strokeWidth = 4.0;

    for (int i = 0; i < path.length - 1; i++) {
      canvas.drawLine(Offset(xScale * path[i].x, yScale * path[i].y),
          Offset(xScale * path[i + 1].x, yScale * path[i + 1].y), paint);
      //print("${xScale * path[i].x}, ${yScale * path[i].y}");
      if (path[i] == from || path[i] == to) {
        canvas.drawCircle(
            Offset(path[i].x, path[i].y), 8, Paint()..color = Colors.black);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
