import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

import 'dijkstra.dart';
import 'graph.dart';

class NavPage extends StatefulWidget {
  const NavPage({super.key});

  @override
  State<NavPage> createState() => _NavPageState();
}

class _NavPageState extends State<NavPage> {
  late final Graph graph;
  late final Node from;
  late final Node to;
  late final bool accessible;
  late int floor;
  late List<Node> path;
  final List<Node> drawnPath = [];
  Node? fromPreviousFloor;
  ImageInfo? imageInfo;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    var args = ModalRoute.of(context)!.settings.arguments as List;
    graph = args[0] as Graph;
    from = args[1] as Node;
    to = args[2] as Node;
    accessible = args[3] as bool;
    floor = from.floor;
    path =
        DijkstraWalk(graph.nodes, graph.edges).dijkstra(from, to, accessible);
    backgroundImage();
  }

  void backgroundImage() {
    setState(() {
      imageInfo = null;
    });
    AssetImage('assets/floorplans/$floor.png')
        .resolve(ImageConfiguration.empty)
        .addListener(ImageStreamListener((info, synchronousCall) {
      setState(() {
        imageInfo = info;
      });
    }));
  }

  bool validFloor(int fl) =>
      fl >= min(from.floor, to.floor) && fl <= max(from.floor, to.floor);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Navigation${accessible ? " (Accessible)" : ""}"),
      ),
      body: Column(
        children: [
          Center(
            child: Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  "Floor $floor",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.left,
                )),
          ),
          imageInfo == null
              ? const Center(child: CircularProgressIndicator())
              : drawMapWithPath(imageInfo!),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                  onPressed: validFloor(floor - 1)
                      ? () => setState(() {
                            floor--;
                            backgroundImage();
                          })
                      : null,
                  child: const Text("Down")),
              ElevatedButton(
                  onPressed: validFloor(floor + 1)
                      ? () => setState(() {
                            floor++;
                            backgroundImage();
                          })
                      : null,
                  child: const Text("Up")),
            ],
          ),
        ],
      ),
    );
  }

  LayoutBuilder drawMapWithPath(ImageInfo imageInfo) {
    return LayoutBuilder(builder: (context, constraints) {
      // padding
      constraints = constraints.deflate(const EdgeInsets.all(10));
      var imgWidth = imageInfo.image.width as double;
      var imgHeight = imageInfo.image.height as double;
      var scaleWidth = constraints.maxWidth / imgWidth;
      var scaleHeight = constraints.maxHeight / imgHeight;
      var width = min(scaleWidth, scaleHeight) * imgWidth;
      var height = min(scaleWidth, scaleHeight) * imgHeight;
      return CustomPaint(
          size: Size(width, height),
          painter: LinePainter(
              imageInfo, path.where((e) => e.floor == floor).toList()));
    });
  }
}

class LinePainter extends CustomPainter {
  final ImageInfo imageInfo;
  final List<Node> path;
  late final TextPainter textPainter;
  get from => path.first;
  get to => path.last;

  LinePainter(this.imageInfo, this.path) {
    const icon = Icons.location_pin;
    textPainter = TextPainter(textDirection: TextDirection.rtl);
    textPainter.text = TextSpan(
        text: String.fromCharCode(icon.codePoint),
        style: TextStyle(
            fontSize: 40.0, fontFamily: icon.fontFamily, color: Colors.blue));
    textPainter.layout();
  }

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.red
      ..strokeWidth = 4.0;

    // resize image
    canvas.drawImageRect(
        imageInfo.image,
        Rect.fromLTWH(0, 0, imageInfo.image.width as double,
            imageInfo.image.height as double),
        Rect.fromLTWH(0, 0, size.width, size.height),
        paint);

    Offset fromNode(p) => Offset(
          p.x * size.width,
          p.y * size.height,
        );

    canvas.drawPoints(PointMode.lines, path.map(fromNode).toList(), paint);
    canvas.drawPoints(
        PointMode.lines, path.sublist(1).map(fromNode).toList(), paint);

    // start and end marker
    canvas.drawCircle(fromNode(from), 8, Paint()..color = Colors.blue);
    if (from != to) {
      textPainter.paint(
          canvas,
          Offset(fromNode(to).dx - textPainter.width / 2,
              fromNode(to).dy - textPainter.height / 2 - 15));
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
