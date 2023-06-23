import 'dart:io';
import 'dart:js';
import 'dart:ui';
import 'package:image/image.dart' as img;
import 'package:flutter/material.dart';
import 'dart:convert';

class ImageLoader {
  late Map<String, Image> floorplans;
  final String DIR_TO_FLOORPLANS = "/lib/assets/floorplans";

  ImageLoader(BuildContext context){
    loadAllFloorplans(context);
  }

  Future<void> loadAllFloorplans(BuildContext context) async {
    // Load as String
    final manifestContent =
    await DefaultAssetBundle.of(context).loadString('AssetManifest.json');

    // Decode to Map
    final Map<String, dynamic> manifestMap = json.decode(manifestContent);

    // Filter by path
    final filtered = manifestMap.keys
        .where((path) => path.startsWith('assets/floorplans/'))
        .where((path) => path.endsWith('.png'))
        .toList();
    print(filtered);
  }
}