import 'package:flutter/material.dart';
import 'package:flutter_mvvm/ui/home_view_model.dart';
import 'package:flutter_mvvm/ui/initializer.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => HomeViewModel(context.read()),
      child: _Home(),
    );
  }
}

class _Home extends StatelessWidget {
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
    return Initializer(
      init: (context) => context.read<HomeViewModel>().fetch(),
      build: (context) => ListView.builder(
        itemCount: 0,
        itemBuilder: (context, index) => _ListItem(index: index),
      ),
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
