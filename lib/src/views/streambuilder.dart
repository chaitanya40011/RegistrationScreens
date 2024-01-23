import 'dart:async';

import 'package:flutter/material.dart';


class StreamBuilderExample extends StatefulWidget {
  const StreamBuilderExample({super.key});

  @override
  State<StreamBuilderExample> createState() => _StreamBuilderExampleState();
}

class _StreamBuilderExampleState extends State<StreamBuilderExample> {
  final StreamController<bool> _checkBoxController = StreamController();

  Stream<bool> get _checkBoxStream => _checkBoxController.stream;
  bool isVisible = false;

  @override
  void dispose() {
    _checkBoxController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Checkbox with stream builder"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Name",
              ),
            ),
            const SizedBox(height: 10),

            const Text("Accept"),
            StreamBuilder(
              stream: _checkBoxStream,
              initialData: false,
              builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
                return Checkbox(
                  value: snapshot.data,
                  onChanged: (changedValue) {
                    _checkBoxController.sink.add(changedValue!);
                    setState(() {
                      isVisible = changedValue!;
                    });
                  },
                );
              },
            ),
            Visibility(
              visible: isVisible,
              child: const Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Email",
                  ),
                ),
              ),
            ),


          ],
        ),
      ),
    );
  }
}