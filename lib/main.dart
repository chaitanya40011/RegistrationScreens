
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  Color backgroundColor = Colors.blueGrey;

  void changeColor(Color color) {
    setState(() {
      backgroundColor = color;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
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
      ),
    );
  }
}


