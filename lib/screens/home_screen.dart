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

  int _getRandomValue(int maxSize) => Random().nextInt(maxSize);

  String _getRandomAttentioner() {
    int generatedIndex = _getRandomValue(_potentialAttentioners.length);
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
      body: ReorderableListView.builder(
        itemCount: _attentioners.length,
        itemBuilder: (context, index) {
          final String attetionerName = _attentioners[index];
          return Dismissible(
              key: Key('$attetionerName ${_getRandomValue(1000000)}'),
              child: Card(
                child: ListTile(
                  leading: const Icon(
                    Icons.person,
                    color: Colors.grey,
                    size: 24.0,
                  ),
                  title: Text(_attentioners[index]),
                ),
              ),
              onDismissed: (DismissDirection directon) => _removeUser(index));
        },
        onReorder: (int oldIndex, int newIndex) {
          setState(() {
            if (oldIndex < newIndex) {
              newIndex -= 1;
            }
            final String reorderedItem = _attentioners.removeAt(oldIndex);
            _attentioners.insert(newIndex, reorderedItem);
          });
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
