import 'dart:math';

import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<String> _attentioners = [
    'Wiktoria',
    'Sebastian',
    'Łukasz',
    'Monika',
    'Michał',
    'Kaja'
  ];

  String _getRandomAttenioner() {
    int generatedIndex = Random().nextInt(_attentioners.length);
    return _attentioners[generatedIndex];
  }

  void _addItem() {
    setState(() {
      _attentioners.add(_getRandomAttenioner());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: _attentioners.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_attentioners[index]),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addItem,
        tooltip: 'Add item',
        child: const Icon(Icons.add),
      ),
    );
  }
}
