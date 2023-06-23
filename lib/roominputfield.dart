import 'package:flutter/material.dart';

class FormValidationExample extends StatelessWidget with InputValidationMixin {
  final formGlobalKey = GlobalKey < FormState > ();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('naviagte-ukn'),
        ),
        body:
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Form(
            key: formGlobalKey,
            child: Column(
              children: [
                const SizedBox(height: 50),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: "your location"
                  ),
                  validator: (email) {
                    if (isRoomValid(email!)) return null;
                    else
                      return 'Enter a valid location';
                  },
                ),
                const SizedBox(height: 24),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "your destination",
                  ),
                  validator: (password) {
                    if (isRoomValid(password!)) return null;
                    else
                      return 'Enter a valid location';
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
                    child: Text("calculate route"))
              ],
            ),
          ),
        ));
  }
}

mixin InputValidationMixin {
  List<String> suggestons = ["USA", "UK", "Uganda", "Uruguay", "United Arab Emirates"];
  bool isRoomValid(String password) {


    return true;
  }
}