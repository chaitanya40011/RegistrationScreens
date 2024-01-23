

import 'package:assignment_4/src/views/streambuilder.dart';
import 'package:assignment_4/src/views/setstate.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyTabBar(),
    );
  }
}

class MyTabBar extends StatefulWidget {
  const MyTabBar({super.key});

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
            Set_State(),
            StreamBuilderExample(),
          ],
        ),
      ),
    );
  }
}


