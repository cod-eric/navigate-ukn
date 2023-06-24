import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'graph.dart';

class RoomInputForm extends StatefulWidget {
  final String placeholder;

  const RoomInputForm(this.placeholder, {super.key});

  @override
  RoomInputField createState() => RoomInputField();
}

class RoomInputField extends State<RoomInputForm> {
  static const int maxItems = 5;
  List<Node> _options = uniKonstanz.nodes;

  List<Node> search(String input) {
    return uniKonstanz.search(input, true /*defualt, TODO: change*/);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextFormField(
            autofocus: true,
            onChanged: (value) {
              setState(() {
                _options = search(value);
              });
            },
            decoration: InputDecoration(
              labelText: widget.placeholder,
            ),
          ),
          const Text("Available Options:"),
          // TODO Gabriel Scrollable
          ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: min(MediaQuery.of(context).size.height ~/ 100, _options.length), //_options.length,
            itemBuilder: (context, index) {
              var node = _options[index];
              return ListTile(
                title: Text(node.name),
                subtitle: Text(node.searchKeywords.join(", ")),
                onTap: () => Navigator.of(context).pop(node),
              );
            },
          )
        ],
      ),
    );
  }
}
