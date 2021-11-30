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
  late List<String> _potentialAttentioners;
  @override
  void initState() {
    _potentialAttentioners = [..._attentioners];
    super.initState();
  }

  String _getRandomAttentioner() {
    int generatedIndex = Random().nextInt(_potentialAttentioners.length);
    return _potentialAttentioners[generatedIndex];
  }

  void _addUser() {
    setState(() {
      _attentioners.add(_getRandomAttentioner());
    });
  }

  void _removeUser(int index) {
    setState(() {
      _attentioners.removeAt(index);
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
          return Card(
            child: ListTile(
              leading: const Icon(
                Icons.person,
                color: Colors.grey,
                size: 24.0,
              ),
              trailing: const Icon(
                Icons.close,
                color: Colors.grey,
                size: 24.0,
              ),
              title: Text(_attentioners[index]),
              onTap: () => _removeUser(index),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addUser,
        tooltip: 'Add user',
        child: const Icon(Icons.add),
      ),
    );
  }
}
