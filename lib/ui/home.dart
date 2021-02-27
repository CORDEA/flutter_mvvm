import 'package:flutter/material.dart';
import 'package:flutter_mvvm/ui/details.dart';
import 'package:flutter_mvvm/ui/home_view_model.dart';
import 'package:flutter_mvvm/ui/initializer.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
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
      init: (context) async {
        final viewModel = context.read<HomeViewModel>();
        viewModel.fetch();
        await for (final event in viewModel.event) {
          switch (event.runtimeType) {
            case NavigateToDetails:
              Navigator.of(context).push(
                Details.route((event as NavigateToDetails).question),
              );
              break;
          }
        }
      },
      build: (context) => Selector<HomeViewModel, int>(
        selector: (_, viewModel) => viewModel.questions.length,
        builder: (_, length, __) => ListView.builder(
          itemCount: length,
          itemBuilder: (_, index) => _ListItem(index: index),
        ),
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
    var item = context.select<HomeViewModel, HomeItemViewModel>(
      (value) => value.questions[_index],
    );
    return ListTile(
      onTap: () => context.read<HomeViewModel>().onItemTapped(_index),
      title: Text(item.title),
      subtitle: Text(item.displayName),
    );
  }
}
