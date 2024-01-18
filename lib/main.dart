

import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CheckBox(),
    );
  }
}

class CheckBox extends StatefulWidget {

  const CheckBox({Key? key}) : super(key: key);

  @override
  State<CheckBox> createState() => _MyFormState();
}

class _MyFormState extends State<CheckBox> {

  final StreamController<bool> _checkBoxController = StreamController();
  Stream<bool> get _checkBoxStream => _checkBoxController.stream;

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
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Name",
              ),
            ),
            const SizedBox(height: 10,),
            const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Phone",
              ),
            ),
            const SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text("Accept"),
                StreamBuilder(
                    stream: _checkBoxStream,
                    initialData: false,
                    builder: (BuildContext context, AsyncSnapshot<bool> snapshot ){
                      return Checkbox(
                          value: snapshot.data,
                          onChanged: (changedValue){
                            _checkBoxController.sink.add(changedValue!);
                          }
                      );
                    }),
              ],
            ),
            const SizedBox(height: 10,),
            ElevatedButton(onPressed: (){},
                child: const Text("Submit"))
          ],
        ),
      ),
    );
  }
}


