import 'package:flutter/material.dart';
import 'package:navigate_ukn/roominputfield.dart';

import 'graph.dart';
import 'map.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Node? from, to;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Navigate the Uni'),
      ),
      body: Container(
        padding: const EdgeInsets.all(40),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildSearchBar(context, "Current Location", true, [
                IconButton(
                    onPressed: () => setState(() {
                          var temp = to;
                          to = from;
                          from = temp;
                        }),
                    icon: const Icon(Icons.swap_vert))
              ]),
              buildSearchBar(context, "Target", false, []),
              ElevatedButton(
                  onPressed: from == null || to == null || from == to
                      ? null
                      : () => Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) =>
                              NavPage(from!, to!))),
                  child: const Text("Find path"))
            ]),
      ),
    );
  }

  SearchBar buildSearchBar(BuildContext context, String hintText, bool isFrom,
      Iterable<Widget>? trailing) {
    var node = isFrom ? from : to;
    return SearchBar(
      trailing: trailing,
      backgroundColor: node != null
          ? from != to
              ? const MaterialStatePropertyAll(Colors.green)
              : const MaterialStatePropertyAll(Colors.red)
          : SearchBarTheme.of(context).backgroundColor,
      leading: const Icon(Icons.location_pin),
      hintText: node == null ? hintText : node.name,
      onTap: () async {
        var node = await Navigator.of(context).push(MaterialPageRoute<Node?>(
            builder: (BuildContext context) => RoomInputForm(hintText)));
        if (node != null) {
          setState(() {
            if (isFrom) {
              from = node;
            } else {
              to = node;
            }
          });
        }
      },
    );
  }
}
