

import 'package:flutter/material.dart';


class Set_State extends StatefulWidget {
  const Set_State({super.key});

  @override
  State<Set_State> createState() => _SetState();
}

class _SetState extends State<Set_State> {
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