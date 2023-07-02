import 'package:flutter/material.dart';

import 'graph.dart';

class RoomInputForm extends StatefulWidget {
  final String placeholder;
  final Graph graph;

  const RoomInputForm(this.placeholder, this.graph, {super.key});

  @override
  RoomInputField createState() => RoomInputField();
}

class RoomInputField extends State<RoomInputForm> {
  static const int maxItems = 5;
  late List<Node> _options;

  List<Node> search(String input) {
    return widget.graph.search(input);
  }

  @override
  void initState() {
    super.initState();
     _options = widget.graph.nodes;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select ${widget.placeholder}"),
      ),
      body: Column(
        children: [
          TextFormField(
            autofocus: true,
            onChanged: (value) {
              setState(() {
                _options = search(value);
              });
            },
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
