import 'package:flutter/material.dart';

import 'graph.dart';

class NavPage extends StatelessWidget {
  final Node from, to;

  const NavPage(this.from, this.to, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text("TODO: Eric ${from.name} to ${to.name}");
  }
}
