import 'package:flutter/material.dart';

import 'dijkstra.dart';
import 'graph.dart';

class NavPage extends StatefulWidget {
  final Node from, to;
  final bool needsAccessible;

  const NavPage(this.from, this.to, this.needsAccessible, {super.key});

  @override
  State<NavPage> createState() => _NavPageState(from, to);
}

class _NavPageState extends State<NavPage> {
  late int floor;
  late List<Node> path;
  final _imageKey = GlobalKey();
  Size imageSize = Size.zero;

  _NavPageState(Node from, Node to) {
    floor = from.floor;
    path = DijkstraWalk(uniKonstanz.nodes, uniKonstanz.edges)
        .dijkstra(from, to, false);
  }

  void _updateImageSize(Duration _) {
    final size = _imageKey.currentContext?.size;
    if (size == null) return;
    if (imageSize != size) {
      setState(() {
        imageSize = size;
      });
    }
  }

  @override
  void didChangeDependencies() {
    MediaQuery.of(context); // Trigger rebuild when window is resized.
    WidgetsBinding.instance.addPostFrameCallback(_updateImageSize);
    super.didChangeDependencies();
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
                key: _imageKey,
                'assets/floorplans/$floor.png',
                fit: BoxFit.contain,
              ),
              CustomPaint(
                  painter: LinePainter(
                      path.where((e) => e.floor == floor).toList(),
                      imageSize.width / 60.0,
                      imageSize.height / 20.0,
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
        canvas.drawCircle(Offset(xScale * path[i].x, yScale * path[i].y), 8,
            Paint()..color = Colors.black);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
