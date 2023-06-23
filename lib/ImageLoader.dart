import 'dart:convert';

import 'package:flutter/material.dart';

class ImageLoader {
  late Map<String, Image> floorplans;
  static const String DIR_TO_FLOORPLANS = "/lib/assets/floorplans";

  ImageLoader(BuildContext context) {
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
