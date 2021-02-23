import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: _Body(),
    );
  }
}

class _Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 0,
      itemBuilder: (context, index) => _ListItem(index: index),
    );
  }
}

class _ListItem extends StatelessWidget {
  final int _index;

  const _ListItem({
    Key? key,
    required int index,
  })   : _index = index,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const Text(''),
      subtitle: const Text(''),
    );
  }
}
