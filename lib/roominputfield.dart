import 'package:flutter/material.dart';
import 'package:navigate_ukn/graph.dart';
import 'main.dart';

class RoomInputField extends StatelessWidget with InputValidationMixin {
  final formGlobalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: formGlobalKey,
        child: Column(
          children: [
            const SizedBox(height: 50),
            TextFormField(
              decoration: const InputDecoration(labelText: "your location"),
              validator: (email) {
                if (isRoomValid(email!)) {
                  return null;
                } else {
                  return 'Enter a valid location';
                }
              },
            ),
            const SizedBox(height: 24),
            TextFormField(
              decoration: const InputDecoration(
                labelText: "your destination",
              ),
              validator: (password) {
                if (isRoomValid(password!)) {
                  return null;
                } else {
                  return 'Enter a valid location';
                }
              },
            ),
            const SizedBox(height: 50),
            ElevatedButton(
                onPressed: () {
                  if (formGlobalKey.currentState!.validate()) {
                    formGlobalKey.currentState?.save();
                    // use the email provided here
                  }
                },
                child: const Text("calculate route"))
          ],
        ));
  }
}

mixin InputValidationMixin {
  List<Tuple<List<String>, int>> roomnames = uniKonstanz.roomnames.cast<Tuple<List<String>, int>>();

  int isRoomValid(String room) {
    for (Tuple t in roomnames) {
      if (t.one.contains())
    }
    return -1;
  }

}

