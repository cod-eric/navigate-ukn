import 'package:flutter/material.dart';

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
    return uniKonstanz.search(input);
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
          Expanded(
              child: ListView.builder(
            itemCount: _options.length,
            itemBuilder: (context, index) {
              var node = _options[index];
              return ListTile(
                title: Text(node.name),
                subtitle: Text(node.searchKeywords.join(", ")),
                onTap: () => Navigator.of(context).pop(node),
              );
            },
          ))
        ],
      ),
    );
  }
}
