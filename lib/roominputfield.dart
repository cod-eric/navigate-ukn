import 'package:flutter/material.dart';

import 'graph.dart';

class MyForm extends StatefulWidget {
  @override
  RoomInputField createState() => RoomInputField();
}
class RoomInputField extends State<MyForm> {
  String _inputText = '';
  List<String> _options = [];

  void _updateOptions(String input) {
    // Call your search function here and update the options based on the input
    _options = search(input).map((e) => e.name).toList();
  }

  List<Node> search(String input) {
    return uniKonstanz.search(input);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              autofocus: true,
              onChanged: (value) {
                setState(() {
                  _inputText = value;
                  _updateOptions(value);
                });
              },
              decoration: InputDecoration(
                labelText: 'Search',
              ),
            ),
            SizedBox(height: 16.0),
            Text('Available Options:'),
            SizedBox(height: 8.0),
            ListView.builder(
              shrinkWrap: true,
              itemCount: _options.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_options[index]),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
