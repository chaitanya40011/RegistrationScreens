import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyTabBar(),
    );
  }
}

class MyTabBar extends StatefulWidget {
  const MyTabBar({Key? key}) : super(key: key);

  @override
  State<MyTabBar> createState() => _MyTabBarState();
}

class _MyTabBarState extends State<MyTabBar> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Tab Bar'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Set State'),
              Tab(text: 'Stream Builder'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            SetState(),
            StreamBuilderExample(),
          ],
        ),
      ),
    );
  }
}

class SetState extends StatefulWidget {
  const SetState({Key? key}) : super(key: key);

  @override
  State<SetState> createState() => _SetState();
}

class _SetState extends State<SetState> {
  Color backgroundColor = Colors.blueGrey;

  void changeColor(Color color) {
    setState(() {
      backgroundColor = color;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () => changeColor(Colors.white),
              child: const Text('Customer'),
            ),
            ElevatedButton(
              onPressed: () => changeColor(Colors.redAccent),
              child: const Text('Agent'),
            ),
            ElevatedButton(
              onPressed: () => changeColor(Colors.green),
              child: const Text('Merchant'),
            ),
          ],
        ),
      ),
    );
  }
}

class StreamBuilderExample extends StatefulWidget {
  const StreamBuilderExample({Key? key}) : super(key: key);

  @override
  State<StreamBuilderExample> createState() => _StreamBuilderExampleState();
}

class _StreamBuilderExampleState extends State<StreamBuilderExample> {
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
        child: Column(
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
                  },
                ),
              ],
            ),
            const SizedBox(height: 10,),
            ElevatedButton(
              onPressed: (){},
              child: const Text("Submit"),
            ),
          ],
        ),
      ),
    );
  }
}
