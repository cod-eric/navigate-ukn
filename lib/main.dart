import 'package:flutter/material.dart';
import 'package:navigate_ukn/roominputfield.dart';




void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MaterialApp(
          home: Scaffold(
        appBar: AppBar(
          title: const Text('Navigate the Uni'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: MyForm(),
        ),
      ))));
}
