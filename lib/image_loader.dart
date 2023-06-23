import 'graph.dart';
import 'dart:io';
import 'dart:js';
import 'dart:ui' as ui;
import 'package:image/image.dart' as img;
import 'package:flutter/material.dart';
import 'dart:convert';

class ImageLoader {
  late Map<String, Image> floorplans;
  final String DIR_TO_FLOORPLANS = "/lib/assets/floorplans";
  late Size size;

  ImageLoader((int, int) size) {
    this.size = Size(size.$1 as double, size.$2 as double);
  }

  Future<void> loadAllFloorplans(List<Node> path) async {
    //TODO: find out which floors there are, load them, then draw on them separately and find a way to display them at the right time
  }

  void drawLines(List<Node> path) {
    //TODO place image on canvas
    //create list of offset points to be drawn (takes result of dijkstra-call as param)
    List<Offset> pathAsOffsets = [];
    for (Node n in path) {
      pathAsOffsets.add(Offset(n.x, n.y));
    }


    CustomPainter cpr = PathPlotterCustomPainter(pathAsOffsets);
    CustomPaint cp = CustomPaint(painter : cpr, size : size);
    //TODO figure out what "draws during draw phase" means
  }
}

class PathPlotterCustomPainter extends CustomPainter {
  late List<Offset> points;
  static const Color lineColor = Colors.black;
  static const double lineWidth = 4;

  PathPlotterCustomPainter(this.points);

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO-skip: implement shouldRepaint
    return false;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final pointMode = ui.PointMode.polygon;
    final paint = Paint()
      ..color = lineColor
      ..strokeWidth = lineWidth;
    canvas.drawPoints(pointMode, points, paint);
  }
}
